import { StrictMode } from "react";
import ReactDOM from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import { Parallax, Background } from "react-parallax";
import "./index.css";
import App from "./App.jsx";

// ROOT VIEW
import Root from "./routes/Root.jsx";
// VIEWS
import NoView from "./views/NoView.jsx";
import SignInView from "./views/SignInView.jsx";
import BoardView from "./views/BoardView.jsx";
import TimesView from "./views/TimesView.jsx";
const root = document.getElementById("root");
const router = createBrowserRouter([
    {
        "path": "/dash/signin",
        "element": <SignInView/>
    },
    {
        "path": "/dash/board",
        "element": <BoardView/>
    },
    {
        "path": "/dash/timer",
        "element": <TimesView/>
    },
    {
        "path": "/",
        "element": <Root/>
    },
    {
        "path": "*",
        "element": <NoView/>
    }
]);


ReactDOM.createRoot(root).render(
    <StrictMode>
        <App/>
        <RouterProvider router={router}/>
    </StrictMode>
)
