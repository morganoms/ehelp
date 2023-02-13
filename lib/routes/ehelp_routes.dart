class EhelpRoutes {
  EhelpRoutes._();

  static const landing = '/';
  static const login = '/login';

  //Client
  static const homeClient = '/home_client';
  static const clientUserProfessionalProfile = '/user_profile';
  static const clientBookingStep1 = '/booking/step1';
  static const clientBookingStep2 = '/booking/step2';
  static const clientBookingStep3 = '/booking/step3';
  static const clientBookingConfirmation = '/booking/confirmation';
  static const clientCallNowPayment = '/call_now/payment';
  static const clientCallNowCalling = '/call_now/calling';
  static const clientCallNowConfirmation = '/call_now/confirmation';
  static const clientCallNowDescription = '/call_now/service_description';

  //Professional
  static const personalData = '/professional/sign_in/personal_data';
  static const addressProfessional = '/professional/sign_in/address';
  static const bankingProfessional = '/professional/sign_in/banking';
  static const homeArea = '/professional/home/area';
  static const homeEditArea = '/professional/home/area/edit';
  static const certificationArea = '/professional/home/area/edit/certification';
  static const workDays = '/professional/home/area/edit/work_days';
  static const workHours = '/professional/home/area/edit/work_hours';
  static const valueCharged = '/professional/home/area/edit/value_carged';
  static const homeProfessional = '/professional/home';
  static const callDetail = '/professional/call_now/detail';
  static const professionalProfile = '/professional/profile';
  static const professionalBanckAccount = '/professional/bank_account';
}
