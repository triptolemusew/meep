import TodosHeader from './Header';
// import TodosFooter from './Footer';
// import TodosMain from './Main';

import React from 'react';

const TodosView = ({
  isBusy,
  isCreating,
  currentFilter,
  availableFilters,
  createTodo,
  filterTodos,
  ...rest
}) => {
  return (
    <div className="todos-view">
      <TodosHeader
        isCreating={isCreating}
        createTodo={createTodo}
        currentFilter={currentFilter}
        filters={availableFilters}
        filterTodos={filterTodos}
      />
      {/* <TodosMain isBusy={isBusy} />
      <TodosFooter isBusy={isBusy} {...rest} /> */}
    </div>
  );
};

export default TodosView;
