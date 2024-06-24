import React from 'react';
import "../styles/TaskBar.css";
/* */
const TaskBar = () => {
    return (

        <main>
            {/* <button type="button" data-bs-toggle="offcanvas" data-bs-target="#staticBackdrop" aria-controls="offcanvas">Gay</button> */}
            <a href="#" type="button" data-bs-toggle="offcanvas" data-bs-target="#staticBackdrop"><i class="fa-solid fa-list-ul"></i></a>
            
            <div className="offcanvas offcanvas-start" data-bs-backdrop="static" tabIndex="-1" id="staticBackdrop" aria-labelledby="staticBackdropLabel">
                

                <div className="offcanvas-body">
                    <ul>
                        <li><a href="/employees">Employees</a></li>
                        <li><a href="/mail">Inbox</a></li>
                        <li><a href="/projects">Projects</a></li>
                        <li><a href="/timesheet">Timesheet</a></li>
                        <li><a href="/board">Board</a></li>
                    </ul>
                </div>
            </div>
        </main>
    );
};

export default TaskBar;