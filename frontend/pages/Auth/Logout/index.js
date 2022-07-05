import {useEffect} from 'react';
import {Redirect, useHistory} from 'react-router-dom';

import {useStores} from '../../../stores';

const LogoutPage = () => {
  const history = useHistory();
  const {sessionStore} = useStores();

  useEffect(() => {
    const logout = async () => {
      if (!sessionStore.token) return;

      // const response = await api

      if (response.ok) {
      }

      sessionStore.setUser(null);
      sessionStore.setToken(null);
      sessionStore.setAuthenticated(false);

      history.push('/');
    };

    logout();
  }, []);

  if (!sessionStore.token) {
    return <Redirect to="/" />;
  }

  return null;
};

export default LogoutPage;
