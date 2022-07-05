import React from 'react';
import classNames from 'classnames';
import './style.css';

import ActionCheckbox from '../../../components/CheckBox';

const TodosFooter = ({
  isBusy,
  todosIds,
  areAllCompleted,
  toggleAllTodos,
  deleteMarkedTodos,
  deleteAllTodos,
}) => {
  return (
    <footer id="todos-view-footer">
      <ActionCheckbox
        show={todosIds.length && !isBusy}
        checked={areAllCompleted}
        action={() => {
          toggleAllTodos(todosIds, !areAllCompleted);
        }}
      >
        {areAllCompleted ? 'Unmark all todos' : 'Mark all as completed'}
      </ActionCheckbox>
      <div
        className={classNames('delete-all', {
          show: areAllCompleted && todosIds.length,
        })}
        onClick={() => {
          deleteAllTodos(todosIds);
        }}
      >
        Delete All
      </div>
    </footer>
  );
};

export default TodosFooter;
