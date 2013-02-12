syn match vimfilerNonMarkedFile2     '.*'
      \ contains=vimfilerNonMark,vimfilerTypeText,vimfilerTypeImage,
      \vimfilerTypeArchive,vimfilerTypeExecute,vimfilerTypeMultimedia,
      \vimfilerTypeDirectory,vimfilerTypeSystem,vimfilerTypeLink,
      \vimfilerSize,vimfilerDate,vimfilerDateToday,vimfilerDateWeek,
      \vimfilerConfigurationFile,vimfilerLogFile,vimfilerAssetFile

syn match vimfilerConfigurationFile ' .*\.yml ' contained
syn match vimfilerConfigurationFile ' .*\.ini ' contained

syn match vimfilerLogFile ' .*\.log ' contained

syn match vimfilerAssetFile ' .*\.js ' contained
syn match vimfilerAssetFile ' .*\.css ' contained
syn match vimfilerAssetFile ' .*\.scss ' contained

hi vimfilerTypeDirectory     ctermfg=63
hi vimfilerConfigurationFile ctermfg=35
hi vimfilerLogFile           ctermfg=61
hi vimfilerAssetFile         ctermfg=134
hi vimfilerTypeLink          ctermfg=5
