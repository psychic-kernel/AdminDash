// import SVGs
import Clock from "../assets/clock.svg";
import Bm from "../assets/bookmark.svg";
import Ca from "../assets/calendar-days.svg";
import Gear from "../assets/gear.svg";
import Ab from "../assets/address-book.svg";
import Env from "../assets/envelope.svg";
import ShNd from "../assets/square-share-nodes.svg";
import "../styles/ToolBar.css";

const ToolBar = () => {

    return (
        <main className="toolbar">
                {/* <a><img className="svg-icon" src={Clock} alt="wtf"/></a>
                <a><img className="svg-icon" src={Gear} alt="wtf"/></a>
                <a><img className="svg-icon" src={Bm} alt="wtf"/></a>
                <a><img className="svg-icon" src={Ca} alt="wtf"/></a>
                <a><img className="svg-icon" src={Ab} alt="wtf"/> </a>
                <a><img className="svg-icon" src={Env} alt="wtf" /></a>
                <a><img className="svg-icon" src={ShNd} alt="wtf" /></a> */}
                <span><a href="#" className="text-primary"><i className="fa-regular fa-clock fa-xl"></i></a></span>
                <span><a className="text-primary"><i className="fa-solid fa-gear fa-xl"></i></a></span>
                <span><a className="text-primary"><i className="fa-regular fa-bookmark fa-xl"></i></a></span>
                <span><a className="text-primary"><i className="fa-regular fa-calendar"></i></a></span>
                <span><a className="text-primary"><i className="fa-regular fa-address-book fa-xl"></i></a></span>
                <span><a className="text-primary"><i className="fa-regular fa-envelope fa-xl"></i></a></span>
                <span><a className="text-primary"><i className="fa-solid fa-share-nodes fa-xl"></i></a></span>
        </main>
    )
}; export default ToolBar;