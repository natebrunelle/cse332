---
title: Calendar
...

<style id="schedule-css">


      #schedule.calendar {
          display: grid;
          width: calc(100%-1ex); 
          background: rgba(0,0,0,0.125); 
          border: 0.5ex solid rgba(0,0,0,0);
          border-radius: 1.5ex; 
          grid-template-columns: 1fr 2fr 1fr 2fr 1fr 2fr 1fr; 
          line-height: 1.4em;
          max-width: 1200px;
          margin: 1ex auto 1ex auto;
      }
      .calendar .day.Sun { grid-column: 1}
      .calendar .day.Mon { grid-column: 2}
      .calendar .day.Tue { grid-column: 3}
      .calendar .day.Wed { grid-column: 4}
      .calendar .day.Thu { grid-column: 5}
      .calendar .day.Fri { grid-column: 6}
      .calendar .day.Sat { grid-column: 7}

      .calendar .day { 
          background: white;
          border-radius: 1ex;
          padding: .25ex .5ex;
          margin: .25ex;
          box-sizing:border-box; 
          overflow: hidden;
      }


      #schedule td, #schedule th { padding: 0ex; }

      .calendar span.date { 
          font-size: 80%;
          margin: 0;
          text-align: right;
          display: block;
      }
      .calendar div {
          padding: 0 0.5ex 0 0.5ex;
          margin: 0 -0.5ex 0 -0.5ex;
      }
      .calendar .special {
        padding-top: 0.5ex;
        padding-bottom: 0.5ex;
        margin-bottom: 0.5ex;
      }
      .calendar .lecture {
        padding-bottom: 0.5ex;
      }

      @media (max-width: 1000px) {
        #schedule.calendar { 
          display: block; 
          max-width: 400px;
          background: white; 
          border: none;
          border-radius: 0; 
        }

        #schedule.calendar .day {
            border-radius: 0;
            margin: 0;
        }

        #schedule.calendar .day.newweek {
            border-top: 2px solid grey !important;
        }
        #schedule.calendar .day:not(.empty) {
            display: block; border-top: 1px solid grey; width: 100%;
            padding: 0;
        }

        #schedule.calendar span.date {
          font-size: 80%; 
          min-width: 7em;
          vertical-align: middle; 
          display: table-cell;
          padding: 0 1ex 0 2ex;
        }
        #schedule.calendar div.events { 
          display: table-cell; 
          vertical-align: middle; 
        }

        #schedule.calendar .day.today .wrapper { 
          margin: 0.5ex 0; 
        }

        #schedule.calendar .events {
          width: 80%;
        }
        #schedule.calendar .special {
          margin: 0;
          width: 100%;
        }
        #schedule.calendar .lecture {
          padding-top: 0.5ex;
        }

      }

      
      span.date.w0:before { content: "Sun "; }
      span.date.w1:before { content: "Mon "; }
      span.date.w2:before { content: "Tue "; }
      span.date.w3:before { content: "Wed "; }
      span.date.w4:before { content: "Thu "; }
      span.date.w5:before { content: "Fri "; }
      span.date.w6:before { content: "Sat "; }

      .assignment:before { content: "due: "; font-size: 80%; }
      .assignment {background: rgba(155,77,227,0.15); }

      .out-date:before { content: "out: "; font-size: 80%; }
      .out-date {background: rgb(233, 245, 208); }

      .last-date:before { content: "last: "; font-size: 80%; }
      .last-date {background: rgb(208, 239, 245); }

      small { opacity: 0.5; }
      .special { background: rgba(215,215,215,0.5); opacity: 0.75; }
      .exam { background: rgba(255,215,0,0.5); opacity: 0.75; }
      span.date { font-family:monospace; }
      details { padding-left: 1em; }
      summary { margin-left: -1em; }

      .day.past { opacity: 0.707; }
      .day.today { box-shadow: 0 0 0.5ex 0.5ex grey; }
      .agenda .day.today .wrapper { margin: 0.5ex 0;}

      .calendar div.day.empty { background: rgba(0,0,0,0); padding: 0em; margin: 0em; border: none; border-radius: 0; min-height: 1.5em; }


  input[type="button"] {
    font: inherit;
    padding: 0.5ex 1ex;
    margin: 0.5ex 1ex;
    border-radius: 0;
    border: 1px solid rgb(188, 188, 188); 
    background-color: rgb(246, 246, 246);
  }

  input[type="button"]:hover {
    cursor: pointer;
    background-color: rgb(235, 235, 235);
  }
</style>


<p style="text-align: center"> <input type="button" value="Show all readings" onclick="document.querySelectorAll('details').forEach(x => x.setAttribute('open','open'))"></input>  <input type="button" value="Hide all readings" onclick="document.querySelectorAll('details').forEach(x => x.removeAttribute('open'))"></input>
</p>



{#include calendar.html}


<script src="schedule.js"></script>

<!--To subscribe to the above calendar, add <http://www.cs.virginia.edu/~njb2b/cs4102/su22/cal.ics> to your calender application of choice.-->
