import { LightningElement } from 'lwc';
import TMX_LOGO from "@salesforce/resourceUrl/jgaoLogo";
import LINKEDIN_SVG from "@salesforce/resourceUrl/linkedInSqure";
import FB_SVG from "@salesforce/resourceUrl/facebookSVG";
import TW_SVG from "@salesforce/resourceUrl/twitterSVG";
import YT_SVG from "@salesforce/resourceUrl/youtubeSVG";

export default class TmxFooter extends LightningElement {
    tmxLogoEN = TMX_LOGO;
    linkedInSVG = LINKEDIN_SVG;
    facebookSVG = FB_SVG;
    twitterSVG = TW_SVG;
    youtubeSVG = YT_SVG;
}