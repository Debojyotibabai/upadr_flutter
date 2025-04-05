import 'package:upadr/models/resend_otp_model.dart';
import 'package:upadr/utils/api_services.dart';
import 'package:upadr/utils/endpoints.dart';

abstract class ResendOtpDataSource {
  Future<String> resendOtp(ResendOtpModel resendOtpModel);
}

class ResendOtpDataSourceImpl implements ResendOtpDataSource {
  @override
  Future<String> resendOtp(ResendOtpModel resendOtpModel) async {
    try {
      final formData = {
        "emailAddress": resendOtpModel.emailAddress,
        "userType": resendOtpModel.userType
      };

      final response = await APIService.instance.request(
        Endpoints.resendOtp,
        DioMethod.post,
        formData: formData,
        contentType: ContentType.json,
      );

      return response.data["message"];
    } catch (err, s) {
      print(err.toString() + s.toString());
      throw (err as Map<String, dynamic>)["message"]!;
    }
  }
}
