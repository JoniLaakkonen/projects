import React from 'react'
import "./footer.css"
import { Link } from 'react-router-dom';
import { navItems } from '../../../assets/NavItems';

function Footer({fullname, mail, phon, street, postalxCity, bnumb}) {
  return (
    <footer>
      <iframe
        id="mapTo"
        src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d917.2286707541574!2d29.7980914!3d62.6267858!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x469b8654fc3f17d7%3A0x53c2243d9203446!2sHiushuone%20Sinna!5e0!3m2!1sfi!2sfi!4v1744987131116!5m2!1sfi!2sfi"
        allowfullscreen=""
        loading="lazy"
        referrerpolicy="no-referrer-when-downgrade"
      ></iframe>
      <div className="footer-body flex-row">
        <div className="footer-contact flex-column">
          <Link to="/">
            <img
              src={process.env.PUBLIC_URL + "/assets/images/logo.png"}
              alt="Lumoava Jasmin"
              className="footerlogo"
            />
          </Link>
          <span id="footer-information">
            Yhteystiedot:
            <br />
            {fullname}
            <br />
            {mail}
            <br />
            {phon}
            <br />
            {street} <br />
            {postalxCity}
            <br />
            <br />
            Y-tunnus: {bnumb}
          </span>
        </div>
        <div className="footer-nav flex-column">
          <span id="footer-information">Navigoi:</span>
          <ul>
            {navItems.map((item) => {
              return (
                <li key={item.id} className="footerNav" id={item.itemId}>
                  <Link to={item.path}>{item.title}</Link>
                </li>
              );
            })}
            <li className="footerNav">
              <Link to={"/tietosuojaseloste"}>Tietosuojaseloste</Link>
            </li>
          </ul>
        </div>
        <div className="footer-some flex-column">
          <span id="footer-information"> Seuraa somessa:</span>
          <div>
            <a href="https://www.instagram.com/sannalaakkonen_slhealth/">
              <img
                src={
                  process.env.PUBLIC_URL + "/assets/images/instagram-svg.png"
                }
                alt="instagram logo"
                className="svgicon ig"
              />{" "}
              Instagram
            </a>
          </div>
        </div>
      </div>
      <div className="flex-row address">
        <address id="tekjanoikeus">@jonilaakkonen2025</address>
      </div>
    </footer>
  );
}

export default Footer