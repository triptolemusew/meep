import React from 'react';

const ActionCheckbox = ({show = true, checked = false, action, children}) => {
  if (!show) {
    return <span></span>;
  }

  return (
    <label className="action-checkbox">
      <input type="checkbox" onChange={action} checked={checked} />
      <span>{children}</span>
    </label>
  );
};

export default ActionCheckbox;
