import React, { useState } from "react";
import { Link, useLocation, useNavigate } from "react-router-dom";
import { navItems } from "../../../assets/NavItems";
import { Services } from "../../../assets/Services";
import "./navbar.css";
import { Box, ListItemButton, ListItemText } from "@mui/material";
import { KeyboardArrowDown } from "@mui/icons-material";

function Navbar() {
  const navigate = useNavigate();
  const [open, setOpen] = useState(false);
  const activeItem = navItems.find(
    (item) => item.path === useLocation.pathname
  );
  
  return (
    <nav>
      <div className="navbar-links">
        <Link to="/">
          <h1 className="logotext">Lumoava Jasmin</h1>
        </Link>
        <div className="nav-options">
          {navItems.map((item) => {
            return (
              item.title != "Tietoja" ?
              <li
                key={item.id}
                className={`${item.cName} ${
                  item === activeItem ? "activeItem" : ""
                }`}
              >
                <Link id="navA" className={item.title} to={item.path}>
                  {item.title}
                </Link>
              </li>
              :
              <li className="nav-item" style={{ position: "relative" }}>
              <ListItemButton onClick={() => setOpen(!open)}>{item.title}</ListItemButton>
              {open && (
                <Box
                  sx={{
                    position: "absolute",
                    top: "100%",
                    left: 0,
                    backgroundColor: "white",
                    boxShadow: 3,
                    borderRadius: 1,
                    zIndex: 10,
                  }}
                >
                  {Services.map((service) => (
                    <ListItemButton
                      key={service.id}
                      component={Link}
                      to={service.path}
                      onClick={() => setOpen(false)}
                    >
                      <ListItemText sx={{'& .MuiTypography-root:hover': {
                        textDecoration: 'underline',                  
                        }, }} primary={service.servicename} 
                      />
                    </ListItemButton>
                  ))}
                </Box>
              )}
            </li>
            );
          })}
          <Link id="navA" className='Downloads' to={''}>
            Varaa aika
          </Link>
        </div>
      </div>
    </nav>
  );
}

export default Navbar;
