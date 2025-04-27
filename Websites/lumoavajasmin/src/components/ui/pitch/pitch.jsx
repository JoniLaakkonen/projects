import React from 'react'
import "./pitch.css"

function Pitch({header, pitchtext, image1, image1alt, image2, image2alt}) {
  return (
    <>
    <div className='pitch-container'>
        <img className='pitch-image1' src={process.env.PUBLIC_URL + "/images/" + image1} alt={image1alt} />
        <div className='flex-column'>
            <h3>{header}</h3>
            <div className='flex-row -ml-margin'>
                <img className='pitch-image2' src={process.env.PUBLIC_URL + "/images/" + image2} alt={image2alt} />
                <p>{pitchtext}</p>
            </div>
        </div>
    </div>
    </>
  )
}

export default Pitch