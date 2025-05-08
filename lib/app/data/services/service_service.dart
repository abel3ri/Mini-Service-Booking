import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/app/data/models/core/service_model.dart';
import 'package:mini_service_booking/app/data/models/misc/error_model.dart';
import 'package:mini_service_booking/app/data/models/misc/success_model.dart';

class ServiceService extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = "https://6818f5db5a4b07b9d1d18341.mockapi.io/api/v1";
  }

  Future<Either<ErrorModel, List<ServiceModel>>> fetchServices({
    Map<String, dynamic>? query,
  }) async {
    try {
      final res = await get("/services", query: query);
      final services = List.from(res.body ?? [])
          .map((service) => ServiceModel.fromJson(service))
          .toList();
      return right(services);
    } catch (e) {
      return left(ErrorModel(title: "Error", message: e.toString()));
    }
  }

  Future<Either<ErrorModel, ServiceModel>> fetchService({
    required String id,
  }) async {
    try {
      final res = await get("/services/${id}");
      final service = ServiceModel.fromJson(res.body);
      return right(service);
    } catch (e) {
      return left(ErrorModel(title: "Error", message: e.toString()));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> createService({
    required Map<String, dynamic> serviceData,
  }) async {
    try {
      await post("/services", serviceData);
      return right(SuccessModel(body: "Successfully created a service"));
    } catch (e) {
      return left(ErrorModel(title: "Error", message: e.toString()));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> updateService({
    required String id,
    required Map<String, dynamic> serviceData,
  }) async {
    try {
      await patch("/services/${id}", serviceData);
      return right(SuccessModel(body: "Successfully updated a service"));
    } catch (e) {
      return left(ErrorModel(title: "Error", message: e.toString()));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> deleteService({
    required String id,
  }) async {
    try {
      await delete("/services/${id}");
      return right(SuccessModel(body: "Successfully deleted a service"));
    } catch (e) {
      return left(ErrorModel(title: "Error", message: e.toString()));
    }
  }
}
