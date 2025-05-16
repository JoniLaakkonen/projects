import React from "react";
import Primaryheader from "../components/ui/header/primaryheader";
import NavBar from "../components/ui/navigation/navbar";
import Pitch from "../components/ui/pitch/pitch";
import Servicecards from "../components/ui/servicecards/servicecards";
import "./pages.css";
import Salebox from "../components/ui/salebox/salebox";
import Footer from "../components/ui/footer/footer";
import CallToAction from "../components/ui/calltoction/calltoaction";

function Homepage() {
  const promotionIsUp = "false";
  return (
    <>
      <main className="homepage">
        <NavBar />
        <Primaryheader
          headerImage={"etusivuheader.jpg"}
          imageAlt={"Spa aiheinen etusivun kuva."}
          headerText={"Lumoava Jasmin"}
          promptText={"Hemmottelua, hoitoa, hyvää oloa ja ennen kaikkea omaa aikaa, juuri sinulle."}
        />
        {promotionIsUp == "true" && 
          < Salebox saleheaeder={"Tähän joku uskomaton tarjous!"} salespitch={"Tähän joku tehokas myyntipuhe houkuttelemaan asiakkaita"} toSaleitem={"#"}/>
        }
        <Servicecards serviceheader={"Palvelut"}/>
        <Pitch
          header={'Toivon, että kokisit tulleesi hoidossa kohdatuksi ja sinulla on hymy huulilla poislähtiessä.'}
          pitchtext={'Lumovan Jasminin käsissä voit turvallisesti hengähtää riippumatta siitä, minkä hoidon olet itsellesi valinnut. Tarvittaessa autan  löytämään sopivan hoidon ja sopivat tuotteet juuri sinulle, ilman kiirettä. <br />Kosmetologipalveluni ovat tarkoitettu kaikenikäisille. '}
          image1={'tyopiste.jpg'}
          image2={'IMG_0688.jpg'}
        />
        <CallToAction image={"etusivuheader.jpg"} imagealt={"Kuvateksti"} promttext={"Tervetuloa palveltavaksi Lumoavan Jasminin käsiin."} readmore={"/hinnasto"} totimes={"/ajanvaraus"}/>
      </main>
      <Footer fullname={"Jasmin Laakkonen"} bnumb={"3524808-1"} mail={"lumoava.jasmin@gmail.com"} phon={"+358-45160-3363"} postalxCity={"80100 Joensuu"} street={"Jukolankatu 19"}/>
    </>
  );
}

export default Homepage;
