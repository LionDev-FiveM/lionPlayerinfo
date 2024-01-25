Config = {}

Config.Command = "playerinfo" --Command


--Default Notify
Config.DefaultNotify = true --turn default notify on(true) or off(false)
Config.NotifyOn = "You have turned <b>on</b> playerinfo" --message when notify go on
Config.NotifyOff = "You have turned <b>off</b> playerinfo" --message when notify go off
Config.notifyTimeout = 5000 --timeout of notify in ms

--okokNotify
Config.OkokNotify = false --turn okoknotify on(true) or off(false)
Config.OkokTitle = "lionPlayerinfo" --header of notify
Config.OkokMessageOn = "You have turned <b>on</b> playerinfo" --message when notify go on
Config.OkokMessageOff = "You have turned <b>off</b> playerinfo" --message when notify go off
Config.OkokNotifyTimeout = 5000 --timeout of notify in ms
Config.OkokTypeOn = 'info' --type of notify when go on
Config.OkokTypeOff = 'info' --type of notify when go out

--Pnotify
Config.PnotifyNotify = false --turn pnotify on(true) or off(false)
Config.PnotifyMessageOn = "You have turned <b>on</b> playerinfo" --message when notify go on
Config.PnotifyMessageOff = "You have turned <b>off</b> playerinfo" --message when notify go off
Config.PnotifyTimeout = 5000 --timeout of notify in ms
Config.PnotifyTypeOn = 'success' --type of notify when go on
Config.PnotifyTypeOff = 'success' --type of notify when go out
Config.PnotifyLayout = "topright" --position of notify

Config.BlipColor = 1 --Here you can change the Blip Color of Blips. https://docs.fivem.net/docs/game-references/blips/#blip-colors


----------------------------------------------
-------------------WEBHOOK--------------------
----------------------------------------------
Config.WebhookToggle = true --Set it to false to disable the webhook and set it to true to enable the webhook
Config.Webhook = "https://discord.com/api/webhooks/1200168814134964294/trOkd6POHypasqV3Smn1fIqh4hEH1UHoFMLUYUlgSJtiMGXW_1H_ByqQbpPjIzwHuhMU" --Webhook

Config.WebhookName = "Lion Development" --Webhook name
Config.Title = "lionPlayerinfo Logs" --Webhook title
Config.EmbedColor = 36605 --embed color. 
Config.ThumbnailImage = "https://media.discordapp.net/attachments/1072182686678011974/1176165993182134312/Lion_Development_Logo.jpeg?ex=65c0ef70&is=65ae7a70&hm=e66c4329714429947445341de1085eea25ff1d1dca5254efddc99c79564a1578&=&format=webp&width=671&height=671" --image
Config.FooterText = "lionPlayerinfo 1.3" --Footer text

Config.Steam = "Steam"
Config.CommandUsed = "Command used"
Config.PlayerIp = "Player IP"
Config.Status = "Status"
Config.OnText = "On"
Config.OffText = "Off"

Config.ServerName = "Lion Development" --Your Server name | You will see it in an error message in chat
Config.ErrorText = "You can't use this command" --No permission Text



Config.VersionCheck = true