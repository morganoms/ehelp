class EhelpRoutes {
  EhelpRoutes._();

  static const landing = '/';
  static const login = '/login';

  //Client
  static const homeClient = '/home_client';
  static const clientUserProfile = '/user_profile';
  static const clientBookingStep1 = '/booking/step1';
  static const clientBookingStep2 = '/booking/step2';
  static const clientBookingStep3 = '/booking/step3';
  static const clientBookingConfirmation = '/booking/confirmation';
  static const clientCallNowPayment = '/call_now/payment';
  static const clientCallNowCalling = '/call_now/calling';
  static const clientCallNowConfirmation = '/call_now/confirmation';

  //Professional
  static const personalData = '/professional/sign_in/personal_data';
  static const addressProfessional = '/professional/sign_in/address';
  static const bankingProfessional = '/professional/sign_in/banking';
  static const homeArea = '/professional/home/area';
}
