import React from 'react'
import { Link } from 'react-router-dom'
import "./salebox.css"

function Salebox({toSaleitem, saleheaeder, salespitch}) {
  
  return (
    <>
        <div id='sale-cntr' className='sale-container'>
            <div className='sale-item'>
                <h3>{saleheaeder}</h3>
                <p>{salespitch}</p>
            </div>
            <div className='sale-link'>
                <Link className="to-sale-item">Varaa aika</Link>
            </div>
        </div>
    </>
  )
}

export default Salebox