# US Real Estate Market 

The motive of this is to design an end-to-end data pipeline for US Real Estate Market trends and monthly statistics. It sources the data from Realtor.com Real Estate Data Library (https://www.realtor.com/research/data/). It contains scores and rankings based on days on market (supply index) and realtor.com views per property (demand index). Data dictionary is in the same website. 

![image](https://user-images.githubusercontent.com/17448775/153026643-c7737c18-b22d-47b6-a874-6d212550a06d.png)

### Dashboard

<div class='tableauPlaceholder' id='viz1644340148566' style='position: relative'><noscript><a href='#'><img alt='USRealEstatemarket ' src='FN&#47;FNYRSHMPN&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='path' value='shared&#47;FNYRSHMPN' /> <param name='toolbar' value='yes' /><param name='static_image' value='FN&#47;FNYRSHMPN&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-US' /><param name='filter' value='publish=yes' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1644340148566');                    var vizElement = divElement.getElementsByTagName('object')[0];                    if ( divElement.offsetWidth > 800 ) { vizElement.style.width='1000px';vizElement.style.height='827px';} else if ( divElement.offsetWidth > 500 ) { vizElement.style.width='1000px';vizElement.style.height='827px';} else { vizElement.style.width='100%';vizElement.style.height='1777px';}                     var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>


TODO : 
1. Streaming append to the data for monthly refresh.
2. Dashboard in-progress.
3. Data Quality checks before data ingestion and processing

Kudos to realtor.com for the data.
