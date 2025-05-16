import React, { useState } from "react";
import { Link, useLocation, useNavigate } from "react-router-dom";
import { navItems } from "../../../assets/NavItems";
import { Services } from "../../../assets/Services";
import "./navbar.css";
import { Box, Button, Divider, IconButton, List, ListItem, ListItemButton, ListItemText, SwipeableDrawer, useMediaQuery } from "@mui/material";
import { KeyboardArrowDown,  Menu as Menuicon } from "@mui/icons-material";
import { useTheme } from "@mui/material/styles";

function Navbar() {
  const navigate = useNavigate();
  const [open, setOpen] = useState(false);
  const [menu, setMenu] = useState(false);
  const activeItem = navItems.find(
    (item) => item.path === useLocation.pathname
  );
  const logoimage = "false";

  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down("md"));

  const renderNavItems = () => (
    <>
      {navItems.map((item) => {
          return (
            item.title != "Tietoja" ?
            <li
              key={item.id}
              className={`${item.cName} ${
                item === activeItem ? "activeItem" : ""
              }`}
            >
              <ListItemButton id="navA" className={item.title} to={item.path}>
                {item.title}
              </ListItemButton>
            </li>
            :
            <li key={item.id} className="nav-item" style={{ position: "relative" }}>
            <ListItemButton id="navA" onClick={() => setOpen(!open)}>{item.title}</ListItemButton>
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
                    to={item.path + "?service=" + service.path}
                    onClick={() => setOpen(false)}
                  >
                    <ListItemText  primary={service.servicename} />
                  </ListItemButton>
                ))}
              </Box>
            )}
          </li>
          );
          <li>
            <ListItemButton id="navA" className={item.title} to={item.path}>
                {item.title}
              </ListItemButton>
          </li>
        })}
    </>
  );
  
  return (
    <nav>
      <div className="navbar-links">
        <Link to="/">
        {logoimage == "false" ? (
          <h1 className="logotext">Lumoava Jasmin</h1>
        ) : (
          <img
          src={process.env.PUBLIC_URL + "/images/navlogo.jpg"}
          alt="Lumoava jasmin logo"
          className="headerpicture"
          style={{height:"80px", objectFit:"contain"}}
          />
        )}
        </Link>

        {isMobile ? (
          <>
            <IconButton onClick={() => setMenu(true)} edge="end" sx={{ ml: "auto" }}>
              <Menuicon />
            </IconButton>
            <SwipeableDrawer
              anchor="left"
              open={menu}
              onClose={() => setMenu(false)}
              onOpen={() => setMenu(true)}
            >
              <Box
                className="sidebar"
                sx={{ width: 250 }}
                role="presentation"
              >
                <h1 className="logotext">Lumoava Jasmin</h1>
                <List>
                  {navItems.map((item) =>
                    item.title !== "Tietoja" ? (
                      <ListItem key={item.id} disablePadding>
                        <ListItemButton component={Link} to={item.path}>
                          <ListItemText primary={item.title} />
                        </ListItemButton>
                      </ListItem>
                    ) : (
                      <ListItem key={item.id} disablePadding sx={{ flexDirection: 'column', alignItems: 'flex-start' }}>
                        <ListItemButton onClick={() => setOpen(!open)}>
                          <ListItemText primary={item.title} />
                        </ListItemButton>
                        {open && (
                          <Box
                            sx={{
                              backgroundColor: "white",
                              width: '100%',
                              pl: 2,
                              boxShadow: 3,
                              borderRadius: 1,
                            }}
                          >
                            {Services.map((service) => (
                              <ListItemButton
                                key={service.id}
                                component={Link}
                                to={item.path + "?service=" + service.path}
                                onClick={() => setOpen(false)}
                                sx={{ width: '100%' }}
                              >
                                <ListItemText primary={service.servicename} />
                              </ListItemButton>
                            ))}
                          </Box>
                        )}
                      </ListItem>
                    )
                  )}
                </List>
                <Divider />
              </Box>
            </SwipeableDrawer>
          </>
        ) : (
          <ul className="nav-options">{renderNavItems()}</ul>
        )}
      </div>
    </nav>
  );
}

export default Navbar;
