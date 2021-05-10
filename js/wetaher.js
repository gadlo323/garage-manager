

//get Wether From API
$(document).ready(function () {
    var City = $("[id*=City_Name_Hebrwo]").val();
   // alert(City);
    if (City == "")
        City = "תל אביב";
    //"<%=City_Name_Hebrwo%>";;
    $.getJSON("http://api.openweathermap.org/data/2.5/weather?q=" + City + "&units=metric&appid=39fb1aab0482da663d9da505ea85a8bd&lang=he", function (date) {
    
        var icon = "http://openweathermap.org/img/w/" + date.weather[0].icon + ".png";
        var temp = Math.floor(date.main.temp);
        var weather = date.weather[0].description;
        $('.icon').attr('src', icon);
        $(".weather").append(weather + temp + '°');


    });
    //get LIcenceNumber From API
    $("input[name *= 'License_NumberID'").focusout(function () {

        $.getJSON("https://data.gov.il/api/action/datastore_search?resource_id=053cea08-09bc-40ec-8f7a-156f0677aff3&q=" + $("[id*=License_NumberID]").val(), function (data) {
           //console.log(data);
            var name = data.result.records["0"].tozeret_nm;
            $("input[name*='Manifcher_ID']").val(name);

            var model = data.result.records["0"].kinuy_mishari + " " + data.result.records["0"].ramat_gimur;
            $("input[name*='model_ID']").val(model);

            var year = data.result.records["0"].shnat_yitzur;
            $("input[name*='YearID']").val(year);

            var deagmManua = data.result.records["0"].degem_manoa;
            $("input[name*='EngineCapacityID']").val(deagmManua);

            var misgeret = data.result.records["0"].misgeret;
            $("input[name*='misgeretID']").val(misgeret);

            var TokefTest = data.result.records["0"].tokef_dt;
            $("input[name*='TtestID']").val(TokefTest);

            var Gimor = data.result.records["0"].ramat_gimur;
            $("input[name*='GimorID']").val(Gimor);

            var Balot = data.result.records["0"].baalut;
            $("input[name*='BalotID']").val(Balot);

            var tozeret_cd = data.result.records['0'].tozeret_cd;
            $("input[name*='tozeretID']").val(tozeret_cd);

            var degem_cd = data.result.records['0'].degem_cd;
            $("input[name*='degemID']").val(degem_cd);


            var delakID = data.result.records['0'].sug_delek_nm;
            $("input[name*='delakID']").val(delakID);

            var colorID = data.result.records['0'].tzeva_rechev;
            $("input[name*='colorID']").val(colorID);
        });
    });


    // clock view
    var Clock = (function () {

        var exports = function (element) {
            this._element = element;
            var html = '';
            for (var i = 0; i < 6; i++) {
                html += '<span>&nbsp;</span>';
            }
            this._element.innerHTML = html;
            this._slots = this._element.getElementsByTagName('span');
            this._tick();
        };

        exports.prototype = {

            _tick: function () {
                var time = new Date();
                this._update(this._pad(time.getHours()) + this._pad(time.getMinutes()) + this._pad(time.getSeconds()));
                var self = this;
                setTimeout(function () {
                    self._tick();
                }, 1000);
            },

            _pad: function (value) {
                return ('0' + value).slice(-2);
            },

            _update: function (timeString) {

                var i = 0, l = this._slots.length, value, slot, now;
                for (; i < l; i++) {

                    value = timeString.charAt(i);
                    slot = this._slots[i];
                    now = slot.dataset.now;

                    if (!now) {
                        slot.dataset.now = value;
                        slot.dataset.old = value;
                        continue;
                    }

                    if (now !== value) {
                        this._flip(slot, value);
                    }
                }
            },

            _flip: function (slot, value) {

                // setup new state
                slot.classList.remove('flip');
                slot.dataset.old = slot.dataset.now;
                slot.dataset.now = value;

                // force dom reflow
                slot.offsetLeft;

                // start flippin
                slot.classList.add('flip');

            }

        };

        return exports;
    }());

    var i = 0, clocks = document.querySelectorAll('.clock'), l = clocks.length;
    for (; i < l; i++) {
        new Clock(clocks[i]);
    }



    // makes sure the whole site is loaded
    $('#status').fadeOut(); // will first fade out the loading animation
    $('#preloader').delay(50).fadeOut(100); // will fade out the white DIV that covers the website.
    $('body').delay(50).css({ 'overflow': 'visible' });

    function time() {

        var d = new Date();
        var day = d.getDate();
        var month = d.getMonth() + 1;
        var year = d.getFullYear();
        date.textContent = day + "/" + month + "/" + year;
    }

    setInterval(time, 1000);

});


