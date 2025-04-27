import React from 'react'
import { Services } from '../../../assets/Services'
import "./servicecards.css"

function Servicecards({serviceheader}) {
  
  return (
    <>
        <div id='sc-cntr'>
            <h4>{serviceheader}</h4>
            <div className='sc-container'>
            {Services.filter(item => item.showcase === "true").slice(0, 4).map((item) => {
                return (
                    <div className='sc-item'>
                        <img className='sc-img-window-style' src={process.env.PUBLIC_URL + "/images/" + item.image} alt={item.imagealt} />
                        <h4>{item.servicename}</h4>
                        <p>{item.about.length > 53 ? item.about.slice(0, 50).trim() + '...' : item.about}</p>
                    </div>
                );
            })}
            </div>
        </div>
    </>
  )
}

export default Servicecards