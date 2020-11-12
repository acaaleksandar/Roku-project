function setVideoDuration(duration)
    minutes = duration / 60
    hours = Fix(minutes / 60)
    minutesLeft = minutes - (hours*60)
    videoDurationFormat = stri(hours) + "h " + stri(minutesLeft) + "min"
    return videoDurationFormat
end function