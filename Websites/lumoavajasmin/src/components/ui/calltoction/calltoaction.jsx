import React from 'react'
import "./calltoaction.css"
import { Link } from 'react-router-dom'

function CallToAction({image, imagealt, promttext, readmore, totimes}) {
  return (
    <div className='cta-container'>
        <img src={process.env.PUBLIC_URL + "/images/" + image} alt={imagealt} />
        <div className='cta-text'>
            <h3>{promttext}</h3>
            <div className='flex-row'>
                <Link to={readmore}>
                    Lue lisää
                </Link>
                <Link to={totimes}>
                    Varaa aika
                </Link>
            </div>
        </div>
    </div>
  )
}

export default CallToAction