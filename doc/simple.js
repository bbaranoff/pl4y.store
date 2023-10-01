

* {
  box-sizing: border-box;
  padding: 0;
  margin: 0;
  font-family: monospace;
}

.progress-bar {
  height: 20px;
  background: #1da1f2;
  box-shadow: 2px 14px 15px -7px rgba(30, 166, 250, 0.36);
  border-radius: 50px;
  transition: all 0.5s;
}

.container {
  width: 100%;
  height: 100vh;
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
  align-items: center;
}
.container h2 {
  margin-bottom: 20px;
}
.container .progress {
  width: 40%;
  height: 200px;
  display: flex;
  flex-flow: column nowrap;
  justify-content: center;
  align-items: start;
  padding: 20px;
  background: #e6e9ff;
  border-radius: 20px;
  box-shadow: 0px 10px 50px #abb7e9;
}

.doc {
  display: block;
  text-align: center;
  font-size: 20px;
  color: white;
  background: #263238;
  padding: 10px;
}

