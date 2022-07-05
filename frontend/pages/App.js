import React from 'react';

import TodosView from './Todos';
import './App.css';

class AppSidebar extends React.Component {
  state = {
    isOpen: false,
  };

  _toggleSidebar() {
    this.setState({isOpen: !this.state.isOpen});
  }

  render() {
    return (
      <aside className={this.state.isOpen ? 'show' : ''}>
        <span
          className="toggle-sidebar"
          onClick={this._toggleSidebar.bind(this)}
        >
          <i className="fa fa-arrow-left" aria-hidden="true" />
        </span>
      </aside>
    );
  }
}

const App = () => {
  return (
    <div id="app">
      <AppSidebar />
      <main>
        <TodosView></TodosView>
      </main>
      <div className="screen"></div>
    </div>
  );
};

export default App;
