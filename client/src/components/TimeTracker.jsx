import {useState, useEffect} from "react";



const TimeTracker = () => {

    const [timer, setTimer] = useState(0);
    


    const startTimer = () => {
        setInterval(() => {
            setTimer(timer++);
            console.log(timer);
        }, 1000);
    };


    return (
        <main>
            <h1>Time Tracker</h1>

            <div className="container">
                <form onSubmit={startTimer}>
                    <div className="form-group">
                        <label htmlFor="project">Project</label>
                        <input type="text" className="form-control" id="project" />
                    </div>
                    <div className="form-group">
                        <label htmlFor="task">Task</label>
                        <input type="text" className="form-control" id="task" />
                    </div>
                    <div className="form-group">
                        <label htmlFor="description">Description</label>
                        <input type="text" className="form-control" id="description" />
                    </div>
                    <div className="form-group">
                        <label htmlFor="time">Time</label>
                        <input type="text" className="form-control" id="time" />
                    </div>
                    <button type="submit" className="btn btn-primary">Submit</button>
                </form>
            </div>
        </main>
    )
}; export default TimeTracker;