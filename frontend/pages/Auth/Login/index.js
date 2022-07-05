import React, {useState} from 'react';

import {backendApi} from '../api';

const App = () => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [name, setName] = useState();
  const [imageUrl, setImageUrl] = useState();
  const [status, setStatus] = useState();
  const [url, setUrl] = useState();

  const login = () => {
    (async () => {
      const response = await backendApi.getRequest();

      window.location.href = response.data;
    })();
  };

  return (
    <div className="App">
      <header className="App-header">
        {!isLoggedIn && (
          <img
            className="signin-btn"
            onClick={login}
            alt="Twitter login button"
            src="https://assets.klaudsol.com/twitter.png"
          />
        )}

        {isLoggedIn && (
          <div>
            <div>
              <img alt="User profile" src={imageUrl} />
            </div>
            <div>Name: {name}</div>
            <div>URL: {url}</div>
            <div>Status: {status}</div>
            <button className="signout-btn" onClick={logout}>
              Sign Out
            </button>
          </div>
        )}
      </header>
    </div>
  );
};

export default App;
