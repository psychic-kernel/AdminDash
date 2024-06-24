import {useState, useEffect} from "react";

const BoardView = () => {


    return (
        <main className="board-view">
            <Todos/>
            <InProgress/>
            <Done/>

            {/* <Calendar/> */}


        </main>
    )
}; export default BoardView;