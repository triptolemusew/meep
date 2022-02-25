import React, { useState, useEffect } from "react";

const App = () => {
  const [count, setCount] = useState(0);

  useEffect(() => {
    const timer = setTimeout(() => setCount(count + 1), 1000);
    return () => clearTimeout(timer);
  }, [count, setCount]);

  return (
    <div>
      <p>
        Page has been open for <code>{count}</code> seconds.
      </p>
    </div>
  );
};

export default App;
