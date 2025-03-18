import 'package:flutter/material.dart';
 import 'package:supabase_flutter/supabase_flutter.dart';
 import 'Model/messageModel.dart';
class AppService extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  Future<void> _createUser(useremail,usercode,username) async {
    final response = await _supabase.auth.signUp('${useremail}', usercode);

    await _supabase
        .from('contact')
        .insert({'id': response.user!.id, 'username': '${username}'}).execute();
  }

  Future<void> createUsers(useremail,usercode,username) async {
    await _createUser(useremail,usercode,username);
   }
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final response = await _supabase.from('contact').select('id, username').execute();
    if (response.error != null) {
      throw Exception('Failed to load users: ${response.error!.message}');
    }
    return List<Map<String, dynamic>>.from(response.data);
  }

  Future<void> signIn(String useremail, String usercode) async {
    await _supabase.auth.signIn(email: useremail, password: usercode);
 //افع الى قائمة يدويا عند لودينع b8faac88-1b8d-4b94-8687-72f83d75a3bc'
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  Future<String> _getUserTo() async {
    String currentUserId = getCurrentUserId();

    try {
      print('Current User ID: $currentUserId');

      final response = await _supabase
          .from('contact')
          .select('id')
          .not('id', 'eq', currentUserId)
          .execute();

      if (response.data != null && response.data.isNotEmpty) {
        return response.data[0]['id'];
      } else {
        return Future.error('No contacts found for user.');
      }
    } catch (e) {
      print('Error fetching user: $e');
      return Future.error('Error fetching user: $e');
    }
  }
/*
  Stream<List<Message>> getMessages() {
    return _supabase
        .from('message')
        .stream(['id'])

       .order('created_at')
        .execute()
        .map((maps) => maps
        .map((item) => Message.fromJson(item, getCurrentUserId()))
        .toList());
  }*/

  Stream<List<Message>> getMessages(String? userTo) {
    final currentUserId = getCurrentUserId();

    return _supabase
        .from('message')
        .select('*')
        .or('user_from.eq.$currentUserId,user_to.eq.$currentUserId')
        .or('user_from.eq.$userTo,user_to.eq.$userTo')
        .order('created_at')
        .execute()
        .asStream()
        .map((response) {

      if (response.error != null) {
        throw Exception('Failed to load conversation: ${response.error!.message}');
      }
      return List<Message>.from(
          response.data.map((item) => Message.fromJson(item, currentUserId)),

      );
    });
  }
   Future<List<String>> getUserIdsWithConversations() async {
    final currentUserId = getCurrentUserId();

    try {
      // اجلب المحادثات المرتبطة بالمستخدم الحالي
      final response = await _supabase
          .from('message')
          .select('user_from, user_to')
          .or('user_from.eq.$currentUserId,user_to.eq.$currentUserId')
          .execute();

      if (response.error != null) {
        throw Exception('Failed to load conversations: ${response.error!.message}');
      }

      // استخدم مجموعة لتجنب التكرار
      final userIds = <String>{};

      // أضف معرفات المستخدمين الذين لديهم محادثات
      for (final item in response.data) {
        if (item['user_from'] != currentUserId) {
          userIds.add(item['user_from']);
        }
        if (item['user_to'] != currentUserId) {
          userIds.add(item['user_to']);
        }
      }

      return userIds.toList();
    } catch (e) {
      print('Error fetching user IDs with conversations: $e');
      return [];
    }
  }
  Future<List<Map<String, dynamic>>> getUserIdsWithConversations1() async {
    final currentUserId = getCurrentUserId();

    try {
      // اجلب المحادثات المرتبطة بالمستخدم الحالي
      final response = await _supabase
          .from('message')
          .select('user_from, user_to')
          .or('user_from.eq.$currentUserId,user_to.eq.$currentUserId')
          .execute();

      if (response.error != null) {
        throw Exception('Failed to load conversations: ${response.error!.message}');
      }

      // استخدم مجموعة لتجنب التكرار
      final userIds = <String>{};

      // أضف معرفات المستخدمين الذين لديهم محادثات
      for (final item in response.data) {
        if (item['user_from'] != currentUserId) {
          userIds.add(item['user_from']);
        }
        if (item['user_to'] != currentUserId) {
          userIds.add(item['user_to']);
        }
      }

      // أضف المستخدم المطلوب إلى المجموعة
      userIds.add('b8faac88-1b8d-4b94-8687-72f83d75a3bc');

      // اجلب معلومات المستخدمين من جدول 'contact' بناءً على المعرفات المسترجعة
      final allUsersResponse = await _supabase
          .from('contact')
          .select('id, username')
          .in_('id', userIds.toList())
          .execute();

      if (allUsersResponse.error != null) {
        throw Exception('Failed to load users: ${allUsersResponse.error!.message}');
      }

      // تحويل البيانات إلى قائمة
      List<Map<String, dynamic>> usersList = List<Map<String, dynamic>>.from(allUsersResponse.data);

      // ترتيب القائمة بحيث يظهر المستخدم المطلوب في البداية
      usersList.sort((a, b) {
        if (a['id'] == 'b8faac88-1b8d-4b94-8687-72f83d75a3bc') return -1; // يظهر في البداية
        if (b['id'] == 'b8faac88-1b8d-4b94-8687-72f83d75a3bc') return 1;  // يظهر في النهاية
        return 0; // لا تغيير في ترتيب الآخرين
      });

      return usersList;
    } catch (e) {
      print('Error fetching user IDs with conversations: $e');
      return [];
    }
  }

  Future<void> saveMessage(String content, String userTo) async {
    // تحقق من أن المحتوى ليس فارغًا
    if (content.isEmpty || userTo.isEmpty) {
      print('Content or userTo cannot be empty');
      return;
    }

    final message = Message.create(
      content: content,
      userFrom: getCurrentUserId(),
      userTo: userTo,
    );

    try {
      final response = await _supabase.from('message').insert(message.toMap()).execute();

      // تحقق من نجاح الإدخال
      if (response.error != null) {
        print('Error saving message: ${response.error!.message}');
      } else {
        print('Message saved successfully');
        notifyListeners(); // Notify listeners after saving the message
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }

  Future<void> markAsRead(String messageId) async {
    await _supabase
        .from('message')
        .update({'mark_as_read': true})
        .eq('id', messageId)
        .execute();
  }


  bool isAuthentificated() => _supabase.auth.currentUser != null;

  String getCurrentUserId() =>
      isAuthentificated() ? _supabase.auth.currentUser!.id : '';

  String getCurrentUserEmail() =>
      isAuthentificated() ? _supabase.auth.currentUser!.email ?? '' : '';
}