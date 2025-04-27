import React from "react";
import "./primaryheader.css";

function Primaryheader({ headerText, promptText, headerImage, imageAlt }) {
  return (
    <>
      <header id="primaryheader">
        {headerImage == "" ?
          <div className="headerbackground" />
        :
          <img
          src={process.env.PUBLIC_URL + "/images/" + headerImage}
          alt={imageAlt}
          className="headerpicture"
          />
        }
        <div className="headershadow"/>
        <div className="headeroverlay">
          <h2 className="headerheader">
            {headerText}
          </h2>
          <h1 className="headerprompt">
            {promptText}
          </h1>
        </div>
      </header>
    </>
  );
}

export default Primaryheader;
