import React from 'react';
import Loading from '../../../components/Loading';
import './style.css';

const TodosMain = ({isBusy}) => {
  return (
    <div id="todos-view-main">
      {isBusy ? <Loading color="#5dcff3" /> : null}
    </div>
  );
};

export default TodosMain;
