import {userTypes} from '../constants';

export const createUserRequest = () => {
  return {
    type: userTypes.CREATE_USER_REQUEST,
  };
};

export const setUser = (user) => {
  return {
    type: userTypes.CREATE_USER_SUCCESS,
    payload: {user},
  };
};

export const createUserFailure = () => {
  return {
    type: userTypes.CREATE_USER_FAILURE,
  };
};

export const fetchUserRequest = () => {
  return {
    type: userTypes.FETCH_USER_REQUEST,
  };
};

export const setCurrentUser = () => {
  return {
    type: userTypes.FETCH_USER_SUCCESS,
    payload: {user},
  };
};

export const fetchUserFailure = () => {
  return {
    type: userTypes.FETCH_USER_FAILURE,
  };
};

export default {
  createUserRequest,
  setUser,
  createUserFailure,
  fetchUserRequest,
  setCurrentUser,
  fetchUserFailure,
};
