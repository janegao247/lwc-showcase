import { LightningElement } from 'lwc';
import JG_LOGO from "@salesforce/resourceUrl/jgaoLogo";
import LINKEDIN_SVG from "@salesforce/resourceUrl/linkedInSqure";
import GITHUB_SVG from "@salesforce/resourceUrl/githubSVG";

export default class SiteFooter extends LightningElement {
    jgaoLogo = JG_LOGO;
    linkedInSVG = LINKEDIN_SVG;
    githubSVG = GITHUB_SVG;
}