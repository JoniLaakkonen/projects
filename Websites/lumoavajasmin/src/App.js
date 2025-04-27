import { useState } from 'react';
import { Route, Routes } from 'react-router-dom';
import Dashboard from './admin/dashboard/Dashboard';
import './App.css';
import { Homepage, Pricepage } from './pages';

function App() {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  // Function to protect admin routes
  //const ProtectedRoute = ({ children }) => {
  //  return isAuthenticated ? children : <Navigate to="/päämies/login" />;
  //};
  //      <Route path="/päämies/login" element={<Login setIsAuthenticated={setIsAuthenticated} />} />
  //<Route
  //          path="/päämies/dashboard"
  //          element={
  //            <ProtectedRoute>
  //              <Dashboard />
  //            </ProtectedRoute>
  //          }

  return (
    <>
      <Routes>
          <Route
            path="/lumoavajasmin/admin/dashboard"
            element={
                <Dashboard />
            }
          />
        <Route path='/' element={<Homepage/>}/>
        <Route path='/hinnasto' element={<Pricepage/>}/>
      </Routes>
    </>
  );
}

export default App;
