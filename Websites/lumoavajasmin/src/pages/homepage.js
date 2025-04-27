import React from "react";
import Primaryheader from "../components/ui/header/primaryheader";
import NavBar from "../components/ui/navigation/navbar";
import Pitch from "../components/ui/pitch/pitch";
import Servicesinfo from "../components/ui/servicesinfo/servicesinfo";
import Servicecards from "../components/ui/servicecards/servicecards";
import "./pages.css";
import Salebox from "../components/ui/salebox/salebox";
import Footer from "../components/ui/footer/footer";
import CallToAction from "../components/ui/calltoction/calltoaction";

function Homepage() {
  const promotionIsUp = "true";
  return (
    <>
      <main className="homepage">
        <NavBar />
        <Primaryheader
          headerImage={"etusivuheader.jpg"}
          imageAlt={"Spa aiheinen etusivun kuva."}
          headerText={"Lumoava Jasmin"}
          promptText={"Terapeuttisia kasvo hoitoja & virkistäviä spa hetkiä"}
        />
        {promotionIsUp && 
          < Salebox saleheaeder={"Tähän joku uskomaton tarjous!"} salespitch={"Tähän joku tehokas myyntipuhe houkuttelemaan asiakkaita"} toSaleitem={"#"}/>
        }
        <Servicecards serviceheader={"Tähän jotain lumoavaa palveluihin liittyen"}/>
        <Pitch
          header={'Tähän otsikko, joka saa asiakkaan valitsemaan juuri sinut'}
          pitchtext={'Tähän teksti, joka saa asiakkaan valitsemaan juuri sinut. Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis inventore unde consequatur, rem distinctio a fuga placeat laudantium impedit quidem sit odio cum suscipit, corrupti amet incidunt adipisci doloribus tempore!'}
          image1={'desk-8380078_1280.jpg'}
          image2={'spa-2422421_1280.jpg'}
        />
        <CallToAction image={"etusivuheader.jpg"} imagealt={"Kuvateksti"} promttext={"Tähän jouku teksti joka saa vielä harkitsemaan"} readmore={"#"} totimes={"#"}/>
      </main>
      <Footer fullname={"Jasmin Laakkonen"} bnumb={"Ytunnus"} mail={"jasse.sposti@com"} phon={"+358XX-XXX-XXXX"} postalxCity={"80100 Joensuu"} street={"Ahomansikka kaksykkönen"}/>
    </>
  );
}

export default Homepage;
