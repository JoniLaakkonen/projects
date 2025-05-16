import React from 'react'

function Textheader({headertext, smalltext}) {
  return (
    <>
        <div id='textheader' className='flex-column text-header-container'>
            <div className="fieldset-title">
                <span className="legend">{smalltext}</span>
            </div>
            <h1>{headertext}</h1>
        </div>
    </>
  )
}

export default Textheader