import {create} from 'apisauce';
import qs from 'qs';

import config from '../config';

const api = create({
  baseURL: `${config.BACKEND_URL}`,
  headers: {
    Accept: 'application/json',
    'Content-Type': 'application/json',
  },
  paramsSerializer: qs.stringify,
  timeout: 30000, // 30 seconds
});

export const getRequest = () => {
  return api.get('/auth/google');
};

export const getCallback = () => {
  return api.get('/auth/google/callback');
};
