import React from 'react'
import { Link } from 'react-router-dom'
import './servicesinfo.css'

function Servicesinfo() {
  return (
    <>
    <div className='service-grid'>
      <div className='bubble st'>
        <h4>How it works</h4>
        <p>We offer you an easy way to connect with people. As user you can place open job place or seek for one, may it be mowing grass, cleaning houses or what ever you decire</p>
      </div>
      <div className='bubble nd'>
        <h4>Payment</h4>
        <p>We offer you easy and safe way to pay and hande payment. <Link>Learn more.</Link></p>
      </div>
      <div className='bubble rd'>
        <h4>What you need</h4>
        <p>To apply for job openings or as we like to say in Finland "tehdä hanttihommia" you need to be registered at least as e light etreprenour.<Link>Learn more.</Link></p>
      </div>
      <div className='bubble th'>
        <h4>Great side hustle</h4>
        <p>As an IDoIt user, you decide what you do, when and how much. As side hustler you wont have to give up the unemployment benefits or such <Link>Learn more.</Link></p>
      </div>
    </div>
    </>
  )
}

export default Servicesinfo