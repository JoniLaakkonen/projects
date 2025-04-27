import React from 'react'
import Smallheader from '../components/ui/header/smallheader'
import Textheader from '../components/ui/header/textheader'
import Navbar from '../components/ui/navigation/navbar'
import { Prices } from '../assets/Prices'
import Pricelist from '../components/ui/pricelist/pricelist'
import Footer from "../components/ui/footer/footer";

function Pricepage() {
  return (
    <>
      <Navbar/>
      <Smallheader image={"etusivuheader.jpg"} text={"Hinnasto"} imagealt={"..."}/>
      <Textheader headertext={"Palvelu"} smalltext={"The"}/>
      
      <Footer fullname={"Jasmin Laakkonen"} bnumb={"Ytunnus"} mail={"jasse.sposti@com"} phon={"+358XX-XXX-XXXX"} postalxCity={"80100 Joensuu"} street={"Ahomansikka kaksykkönen"}/>
    </>
  )
}

export default Pricepage