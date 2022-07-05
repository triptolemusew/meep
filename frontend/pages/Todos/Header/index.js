import React, {useState} from 'react';
import classNames from 'classnames';
import {
  Select as MuiSelect,
  MenuItem,
  FormControl,
  InputLabel,
} from '@material-ui/core';

import './style.css';

const TodosHeader = ({
  isCreating,
  currentFilter,
  filters,
  createTodo,
  filterTodos,
}) => {
  // const [selectedOption, setSelectedOption] = useState(null);

  return (
    <header id="todos-view-header">
      <section className="left">
        <h4>TODOS</h4>
        {/* <Select
          defaultValue={selectedOption}
          onChange={setSelectedOption}
          options={options}
        /> */}
        <FormControl>
          <InputLabel>{'input label'}</InputLabel>
          <MuiSelect id="something" value={1} label="Age">
            <MenuItem value={10}>ten</MenuItem>
          </MuiSelect>
        </FormControl>
        {/* <Select
          name="form-field-name"
          className="filters"
          value={currentFilter}
          isClearable={false}
          isSearchable={false}
          options={filters.map((f) => {
            return {
              valie: f,
              label: f[0] + f.slice(1).toLowerCase(),
            };
          })}
          onChange={(option) => {
            filterTodos(option.value);
          }}
        /> */}
      </section>
      <a
        className={classNames('add-todo', {
          processing: isCreating,
        })}
        href="#"
        onClick={(e) => {
          e.preventDefault();
          createTodo({title: 'New Todo'});
        }}
      >
        <i className="fa fa-plus" aria-hidden="true"></i>
      </a>
    </header>
  );
};

export default TodosHeader;
