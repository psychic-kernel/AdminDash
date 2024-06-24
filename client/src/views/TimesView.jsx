
const TimesView = () => {
    const [timer, setTimer] = useState(0);



    const handlePlayButton = () => {
        let time = new Date().toLocaleTimeString();
        setInterval(() => {
            setTimer(time);
        }, 1000);
    }


    return (
        <main>
            <h1>Time Tracker</h1>
            <span>Time Clock: {timer}</span>
            <div>
                <button onClick={handlePlayButton} >Play</button>
            </div>
        </main>
    )
}; export default TimesView;