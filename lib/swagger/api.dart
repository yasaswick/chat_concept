library swagger.api;

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';

part 'api/user_api.dart';
part 'model/auth_details.dart';
part 'model/body_upload_profile_image_user_profile_image_post.dart';
part 'model/http_validation_error.dart';
part 'model/user_create.dart';
part 'model/user_view.dart';
part 'model/user_view_private.dart';
part 'model/validation_error.dart';

ApiClient defaultApiClient =
    ApiClient(basePath: 'https://chirp-yasas.herokuapp.com');
