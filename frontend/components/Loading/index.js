import React from 'react';
import ScaleLoader from 'halogen/ScaleLoader';

const Loading = ({color, margin = '0 px'}) => {
  const styles = {
    display: 'flex',
    justifyContent: 'center',
    margin: margin,
  };

  return (
    <div style={styles}>
      <ScaleLoader color={color} />
    </div>
  );
};

export default Loading;
