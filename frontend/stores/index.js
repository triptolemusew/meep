import {createContext, useContext} from 'react';
import {create} from 'mobx-persist';

import SessionStore from './sessionStore';

const PERSIST_VERSION = 1;

class RootStore {
  constructor() {
    this.sessionStore = new SessionStore(this);
  }

  async rehydrate() {
    const persists = [{key: 'session', store: this.sessionStore}];
    const hydrate = create({
      storage: localStorage,
      jsonify: true,
    });
    await Promise.all(
      persists.map((persist) => {
        return hydrate(
          `mobx_v${PERSIST_VERSION}_${persist.key}`,
          persist.store,
        );
      }),
    );
  }
}

export const rootStore = new RootStore();
export const rehydrate = rootStore.rehydrate.bind(rootStore);

const StoreContext = createContext();

export const useStores = () => {
  const stores = useContext(StoreContext);
  return stores;
};

const getDisplayName = (Component) => {
  return Component.displayName || Component.name || 'Component';
};

export const withStores = (WrappedComponent) => {
  const WithStores = (props) => {
    const stores = useStores();
    return <WrappedComponent {...props} stores={stores} />;
  };
  WithStores.displayName = `WithStores(${getDisplayName(WrappedComponent)})`;
  return WithStores;
};
