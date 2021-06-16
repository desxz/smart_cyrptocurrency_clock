# Smart Cryptocurrency Clock
This repository includes our 2020-2021 Spring Semester Introduction to Embedded Systems(CENG3006) Class Final Project.

## Team Members(sorted by name)

<table>
  <tr>
    <td align="center"><a href="https://github.com/ahmtgrbz"><img src="https://avatars0.githubusercontent.com/u/44843548?s=460&v=4" width="100px;" alt=""/><br /><sub><b>Ahmet GÜRBÜZ</b></sub></a><br /><br /><sub><b>Arduino</b></sub></a><br /></a></td>
    <td align="center"><a href="https://github.com/desxz"><img src="https://avatars1.githubusercontent.com/u/63814984?s=460&u=e54733ff64da68c0013cff94fb45ca81272802de&v=4" width="100px;" alt=""/><br /><sub><b>Murat GUN</b></sub></a><br /><br /><sub><b>Mobile Development</b></sub></a><br /></a></td>
    <td align="center"><a href="https://github.com/onur-duman"><img src="https://avatars1.githubusercontent.com/u/44534189?s=460&u=74a6216bbebfee1609e631f3ce80ab8241bdfc6a&v=4" width="100px;" alt=""/><br /><sub><b>Onur DUMAN</b></sub></a><br /><br /><sub><b>Arduino</b></sub></a><br /></a></td>
  </tr>
</table>

## Requirements Libraries

* Arduino Json `6.7.12` by `Benoit Blanchon`

## Project Description

Our project, “Smart Cryptocurrency Clock”, instantly displays cryptocurrencies on a smart clock. <br/>
You can select the cryptocurrencies that you want to follow.<br/>
Additionally, an alarm can be set to the desired value for the cryptocurrencies.<br/>

## Technical Details

### Embedded System

In the development of the project, we’ve preferred NodeMCU Esp8266 as a kit for embedded system. The reason we prefer the NodeMCU ESP8266 kit is having WiFi module. It is necessary both to communicate with the API and to receive alarm data.

### Mobile Application 

Dart language was used for the development of mobile application. It has been preferred because It can be easily developed and released to more than one platform at the same time thanks to the Flutter framework.

### Database Service

A database service was needed in order to store the cryptocurrencies selected by the users on mobile application and the prices setted form alarms. For this reason, Firebase, which is one of the most used database services, has ben preferred.

### Cryptocurrency API

Instant prices of cryptocurrencies are taken with an api service. Coingecko is used for API service.

## Project Pictures

### General Architecture

![General Architecture](https://i.hizliresim.com/5uw0qpk.png)

### Smart Cryptocurrency Clock

![Smart Cryptocurrency Clock](https://i.hizliresim.com/rsgeiy0.jpeg)

### User Interface

![1](https://i.hizliresim.com/kc9jbkd.jpeg)
![2](https://i.hizliresim.com/8t1810h.jpeg)
![3](https://i.hizliresim.com/luenvkg.jpeg)

## Files Structure
### Folder
* > *Arduino* - Inculudes arduino file
* > *crypto_currency_app* - Inculudes mobil application project
* > *design* - Inculudes some designs

