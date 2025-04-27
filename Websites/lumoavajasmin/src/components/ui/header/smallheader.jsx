import React from 'react'

function Smallheader({image, text, imageAlt}) {
  return (
    <>
    <header id="primaryheader small">
        {image == "" ?
          <div className="headerbackground small" />
        :
          <img
          src={process.env.PUBLIC_URL + "/images/" + image}
          alt={imageAlt}
          className="headerpicture small"
          />
        }
    <div className="headershadow small"/>
    <div className="headeroverlay small">
      <h2 className="headerheader">
        {text}
      </h2>
    </div>
  </header>
    </>
  )
}

export default Smallheader