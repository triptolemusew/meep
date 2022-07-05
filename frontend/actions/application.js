import {appTypes} from '../constants';

export const initializeAppRequest = (filter) => {
  return {
    type: appTypes.INITIALIZE_APP_REQUEST,
  };
};

export const initializeApp = () => {
  return {
    type: appTypes.INITIALIZE_APP_SUCCESS,
  };
};

export const initializeAppFailure = () => {
  return {
    type: appTypes.INITIALIZE_APP_FAILURE,
  };
};

export default {
  initializeAppRequest,
  initializeApp,
  initializeAppFailure,
};
