import {observable, action} from 'mobx';
import {persist} from 'mobx-persist';

class SessionStore {
  constructor(rootStore) {
    this.rootStore = rootStore;
  }

  @observable user = null;

  @action setUser(user) {
    this.user = user;
  }

  @persist @observable token = null;

  @action setToken(token) {
    this.token = token;
  }

  @observable authenticated = false;

  @action setAuthenticated(authenticated) {
    this.authenticated = authenticated;
  }
}

export default SessionStore;
