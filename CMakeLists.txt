# Cataclysm data files
cmake_minimum_required(VERSION 3.1.4)

SET(CATACLYSM_DATA_DIRS
    ${CMAKE_SOURCE_DIR}/data/Unlesh The Mods
    ${CMAKE_SOURCE_DIR}/data/Tilesets
    ${CMAKE_SOURCE_DIR}/data/Obsolete+updates mods
)

IF(SOUND)
    SET(CATACLYSM_DATA_DIRS
      ${CATACLYSM_DATA_DIRS}
      ${CMAKE_SOURCE_DIR}/data/sound
    )
ENDIF(SOUND)

IF(TILES)
    SET(CATACLYSM_DATA_DIRS
      ${CATACLYSM_DATA_DIRS}
      ${CMAKE_SOURCE_DIR}/gfx
    )
ENDIF(TILES)

SET(CATACLYSM_DATA_FILES
    ${CMAKE_SOURCE_DIR}/data/changelog.txt
    ${CMAKE_SOURCE_DIR}/data/cataicon.ico
    ${CMAKE_SOURCE_DIR}/data/fontdata.json
    ${CMAKE_SOURCE_DIR}/LICENSE.txt
)

IF(RELEASE)
    install(DIRECTORY ${CATACLYSM_DATA_DIRS} DESTINATION ${DATA_PREFIX})
    install(FILES ${CATACLYSM_DATA_FILES} DESTINATION ${DATA_PREFIX})
ENDIF(RELEASE)

