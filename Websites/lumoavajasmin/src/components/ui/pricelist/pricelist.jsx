import React from 'react'
import "./pricelist.css"

function Pricelist({title, prices }) {
  return (
    <>
        <div id='pricelist' className='flex-column pricelist-container'>
        <div className="fieldset-title">
            <span className="legend">{title}</span>
        </div>
        <table>
            {prices.map((item) => {
            return (
            <tr key={item.id}>
                <td>{item.servicename}</td>
                <td className='align-end'>{item.price}</td>
            </tr>
            );
            })}
        </table>
        </div>
    </>
  )
}

export default Pricelist