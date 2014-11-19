{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE GeneralizedNewtypeDeriving  #-}
{-# LANGUAGE LambdaCase                  #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.S3.Types
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Network.AWS.S3.Types
    (
    -- * Service
      S3
    -- ** Error
    , RESTError

    -- * Event
    , Event (..)

    -- * NoncurrentVersionExpiration
    , NoncurrentVersionExpiration
    , noncurrentVersionExpiration
    , nveNoncurrentDays

    -- * Transition
    , Transition
    , transition
    , tDate
    , tDays
    , tStorageClass

    -- * DeleteMarkerEntry
    , DeleteMarkerEntry
    , deleteMarkerEntry
    , dmeIsLatest
    , dmeKey
    , dmeLastModified
    , dmeOwner
    , dmeVersionId

    -- * ExpirationStatus
    , ExpirationStatus (..)

    -- * Part
    , Part
    , part
    , pETag
    , pLastModified
    , pPartNumber
    , pSize

    -- * VersioningConfiguration
    , VersioningConfiguration
    , versioningConfiguration
    , vcMFADelete
    , vcStatus

    -- * Tag
    , Tag
    , tag
    , tagKey
    , tagValue

    -- * ObjectStorageClass
    , ObjectStorageClass (..)

    -- * MetadataDirective
    , MetadataDirective (..)

    -- * RedirectAllRequestsTo
    , RedirectAllRequestsTo
    , redirectAllRequestsTo
    , rartHostName
    , rartProtocol

    -- * RoutingRule
    , RoutingRule
    , routingRule
    , rrCondition
    , rrRedirect

    -- * NotificationConfiguration
    , NotificationConfiguration
    , notificationConfiguration
    , ncCloudFunctionConfiguration
    , ncQueueConfiguration
    , ncTopicConfiguration

    -- * S3ServiceError
    , S3ServiceError
    , s3ServiceError
    , sseCode
    , sseKey
    , sseMessage
    , sseVersionId

    -- * ObjectCannedACL
    , ObjectCannedACL (..)

    -- * BucketVersioningStatus
    , BucketVersioningStatus (..)

    -- * DeletedObject
    , DeletedObject
    , deletedObject
    , do1DeleteMarker
    , do1DeleteMarkerVersionId
    , do1Key
    , do1VersionId

    -- * ObjectVersionStorageClass
    , ObjectVersionStorageClass (..)

    -- * CopyPartResult
    , CopyPartResult
    , copyPartResult
    , cprETag
    , cprLastModified

    -- * EncodingType
    , EncodingType (..)

    -- * RequestPaymentConfiguration
    , RequestPaymentConfiguration
    , requestPaymentConfiguration
    , rpcPayer

    -- * CORSRule
    , CORSRule
    , corsrule
    , corsrAllowedHeaders
    , corsrAllowedMethods
    , corsrAllowedOrigins
    , corsrExposeHeaders
    , corsrMaxAgeSeconds

    -- * WebsiteConfiguration
    , WebsiteConfiguration
    , websiteConfiguration
    , wcErrorDocument
    , wcIndexDocument
    , wcRedirectAllRequestsTo
    , wcRoutingRules

    -- * NoncurrentVersionTransition
    , NoncurrentVersionTransition
    , noncurrentVersionTransition
    , nvtNoncurrentDays
    , nvtStorageClass

    -- * Initiator
    , Initiator
    , initiator
    , iDisplayName
    , iID

    -- * ObjectIdentifier
    , ObjectIdentifier
    , objectIdentifier
    , oiKey
    , oiVersionId

    -- * Bucket
    , Bucket
    , bucket
    , bCreationDate
    , bName

    -- * Protocol
    , Protocol (..)

    -- * Grant
    , Grant
    , grant
    , gGrantee
    , gPermission

    -- * Rule
    , Rule
    , rule
    , rExpiration
    , rID
    , rNoncurrentVersionExpiration
    , rNoncurrentVersionTransition
    , rPrefix
    , rStatus
    , rTransition

    -- * TopicConfiguration
    , TopicConfiguration
    , topicConfiguration
    , tcEvent
    , tcEvents
    , tcId
    , tcTopic

    -- * QueueConfiguration
    , QueueConfiguration
    , queueConfiguration
    , qcEvent
    , qcEvents
    , qcId
    , qcQueue

    -- * Owner
    , Owner
    , owner
    , oDisplayName
    , oID

    -- * BucketLoggingStatus
    , BucketLoggingStatus
    , bucketLoggingStatus
    , blsLoggingEnabled

    -- * ErrorDocument
    , ErrorDocument
    , errorDocument
    , edKey

    -- * StorageClass
    , StorageClass (..)

    -- * ObjectVersion
    , ObjectVersion
    , objectVersion
    , ovETag
    , ovIsLatest
    , ovKey
    , ovLastModified
    , ovOwner
    , ovSize
    , ovStorageClass
    , ovVersionId

    -- * TargetGrant
    , TargetGrant
    , targetGrant
    , tgGrantee
    , tgPermission

    -- * MFADeleteStatus
    , MFADeleteStatus (..)

    -- * Payer
    , Payer (..)

    -- * Redirect
    , Redirect
    , redirect
    , rHostName
    , rHttpRedirectCode
    , rProtocol
    , rReplaceKeyPrefixWith
    , rReplaceKeyWith

    -- * BucketLogsPermission
    , BucketLogsPermission (..)

    -- * CompletedPart
    , CompletedPart
    , completedPart
    , cpETag
    , cpPartNumber

    -- * CreateBucketConfiguration
    , CreateBucketConfiguration
    , createBucketConfiguration
    , cbcLocationConstraint

    -- * Tagging
    , Tagging
    , tagging
    , tTagSet

    -- * LifecycleExpiration
    , LifecycleExpiration
    , lifecycleExpiration
    , leDate
    , leDays

    -- * CORSConfiguration
    , CORSConfiguration
    , corsconfiguration
    , corscCORSRules

    -- * Object
    , Object
    , object'
    , oETag
    , oKey
    , oLastModified
    , oOwner
    , oSize
    , oStorageClass

    -- * CommonPrefix
    , CommonPrefix
    , commonPrefix
    , cpPrefix

    -- * MultipartUpload
    , MultipartUpload
    , multipartUpload
    , muInitiated
    , muInitiator
    , muKey
    , muOwner
    , muStorageClass
    , muUploadId

    -- * Type
    , Type (..)

    -- * TransitionStorageClass
    , TransitionStorageClass (..)

    -- * CompletedMultipartUpload
    , CompletedMultipartUpload
    , completedMultipartUpload
    , cmuParts

    -- * Condition
    , Condition
    , condition
    , cHttpErrorCodeReturnedEquals
    , cKeyPrefixEquals

    -- * Permission
    , Permission (..)

    -- * AccessControlPolicy
    , AccessControlPolicy
    , accessControlPolicy
    , acpGrants
    , acpOwner

    -- * BucketCannedACL
    , BucketCannedACL (..)

    -- * MFADelete
    , MFADelete (..)

    -- * CloudFunctionConfiguration
    , CloudFunctionConfiguration
    , cloudFunctionConfiguration
    , cfcCloudFunction
    , cfcEvent
    , cfcEvents
    , cfcId
    , cfcInvocationRole

    -- * Grantee
    , Grantee
    , grantee
    , gDisplayName
    , gEmailAddress
    , gID
    , gType
    , gURI

    -- * LifecycleConfiguration
    , LifecycleConfiguration
    , lifecycleConfiguration
    , lcRules

    -- * LoggingEnabled
    , LoggingEnabled
    , loggingEnabled
    , leTargetBucket
    , leTargetGrants
    , leTargetPrefix

    -- * ServerSideEncryption
    , ServerSideEncryption (..)

    -- * IndexDocument
    , IndexDocument
    , indexDocument
    , idSuffix

    -- * CopyObjectResult
    , CopyObjectResult
    , copyObjectResult
    , corETag
    , corLastModified

    -- * Delete
    , Delete
    , delete'
    , dObjects
    , dQuiet

    -- * RestoreRequest
    , RestoreRequest
    , restoreRequest
    , rDays

    -- * Common
    , module Network.AWS.S3.Internal
    ) where

import Network.AWS.Error
import Network.AWS.Prelude
import Network.AWS.Signing.V4
import Network.AWS.S3.Internal
import qualified GHC.Exts

-- | Version @2006-03-01@ of the Amazon Simple Storage Service service.
data S3

instance AWSService S3 where
    type Sg S3 = V4
    type Er S3 = RESTError

    service = Service
        { _svcEndpoint     = global
        , _svcAbbrev       = "S3"
        , _svcPrefix       = "s3"
        , _svcVersion      = "2006-03-01"
        , _svcTargetPrefix = Nothing
        , _svcJSONVersion  = Nothing
        }

    handle = restError alwaysFail

data Event
    = S3ObjectCreatedCompleteMultipartUpload -- ^ s3:ObjectCreated:CompleteMultipartUpload
    | S3ObjectCreatedCopy                    -- ^ s3:ObjectCreated:Copy
    | S3ObjectCreatedPost                    -- ^ s3:ObjectCreated:Post
    | S3ObjectCreatedPut                     -- ^ s3:ObjectCreated:Put
    | S3ReducedRedundancyLostObject          -- ^ s3:ReducedRedundancyLostObject
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable Event

instance FromText Event where
    parser = match "s3:ObjectCreated:CompleteMultipartUpload" S3ObjectCreatedCompleteMultipartUpload
         <|> match "s3:ObjectCreated:Copy"                    S3ObjectCreatedCopy
         <|> match "s3:ObjectCreated:Post"                    S3ObjectCreatedPost
         <|> match "s3:ObjectCreated:Put"                     S3ObjectCreatedPut
         <|> match "s3:ReducedRedundancyLostObject"           S3ReducedRedundancyLostObject

instance ToText Event where
    toText = \case
        S3ObjectCreatedCompleteMultipartUpload -> "s3:ObjectCreated:CompleteMultipartUpload"
        S3ObjectCreatedCopy                    -> "s3:ObjectCreated:Copy"
        S3ObjectCreatedPost                    -> "s3:ObjectCreated:Post"
        S3ObjectCreatedPut                     -> "s3:ObjectCreated:Put"
        S3ReducedRedundancyLostObject          -> "s3:ReducedRedundancyLostObject"

instance FromXML Event where
    parseXML = parseXMLText "Event"

instance ToXML Event where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

newtype NoncurrentVersionExpiration = NoncurrentVersionExpiration
    { _nveNoncurrentDays :: Int
    } deriving (Eq, Ord, Show, Generic, Enum, Num, Integral, Real)

-- | 'NoncurrentVersionExpiration' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'nveNoncurrentDays' @::@ 'Int'
--
noncurrentVersionExpiration :: Int -- ^ 'nveNoncurrentDays'
                            -> NoncurrentVersionExpiration
noncurrentVersionExpiration p1 = NoncurrentVersionExpiration
    { _nveNoncurrentDays = p1
    }

-- | Specifies the number of days an object is noncurrent before Amazon S3 can
-- perform the associated action. For information about the noncurrent days
-- calculations, see How Amazon S3 Calculates When an Object Became
-- Noncurrent in the Amazon Simple Storage Service Developer Guide.
nveNoncurrentDays :: Lens' NoncurrentVersionExpiration Int
nveNoncurrentDays =
    lens _nveNoncurrentDays (\s a -> s { _nveNoncurrentDays = a })

instance FromXML NoncurrentVersionExpiration where
    parseXML x = NoncurrentVersionExpiration
        <$> x .@ "NoncurrentDays"

instance ToXML NoncurrentVersionExpiration where
    toXML NoncurrentVersionExpiration{..} = nodes "NoncurrentVersionExpiration"
        [ "NoncurrentDays" =@ _nveNoncurrentDays
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data Transition = Transition
    { _tDate         :: Maybe ISO8601
    , _tDays         :: Maybe Int
    , _tStorageClass :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'Transition' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'tDate' @::@ 'Maybe' 'UTCTime'
--
-- * 'tDays' @::@ 'Maybe' 'Int'
--
-- * 'tStorageClass' @::@ 'Maybe' 'Text'
--
transition :: Transition
transition = Transition
    { _tDate         = Nothing
    , _tDays         = Nothing
    , _tStorageClass = Nothing
    }

-- | Indicates at what date the object is to be moved or deleted. Should be in
-- GMT ISO 8601 Format.
tDate :: Lens' Transition (Maybe UTCTime)
tDate = lens _tDate (\s a -> s { _tDate = a })
    . mapping _Time

-- | Indicates the lifetime, in days, of the objects that are subject to the
-- rule. The value must be a non-zero positive integer.
tDays :: Lens' Transition (Maybe Int)
tDays = lens _tDays (\s a -> s { _tDays = a })

-- | The class of storage used to store the object.
tStorageClass :: Lens' Transition (Maybe Text)
tStorageClass = lens _tStorageClass (\s a -> s { _tStorageClass = a })

instance FromXML Transition where
    parseXML x = Transition
        <$> x .@? "Date"
        <*> x .@? "Days"
        <*> x .@? "StorageClass"

instance ToXML Transition where
    toXML Transition{..} = nodes "Transition"
        [ "Date"         =@ _tDate
        , "Days"         =@ _tDays
        , "StorageClass" =@ _tStorageClass
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data DeleteMarkerEntry = DeleteMarkerEntry
    { _dmeIsLatest     :: Maybe Bool
    , _dmeKey          :: Maybe Text
    , _dmeLastModified :: Maybe RFC822
    , _dmeOwner        :: Maybe Owner
    , _dmeVersionId    :: Maybe Text
    } deriving (Eq, Show, Generic)

-- | 'DeleteMarkerEntry' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dmeIsLatest' @::@ 'Maybe' 'Bool'
--
-- * 'dmeKey' @::@ 'Maybe' 'Text'
--
-- * 'dmeLastModified' @::@ 'Maybe' 'UTCTime'
--
-- * 'dmeOwner' @::@ 'Maybe' 'Owner'
--
-- * 'dmeVersionId' @::@ 'Maybe' 'Text'
--
deleteMarkerEntry :: DeleteMarkerEntry
deleteMarkerEntry = DeleteMarkerEntry
    { _dmeOwner        = Nothing
    , _dmeKey          = Nothing
    , _dmeVersionId    = Nothing
    , _dmeIsLatest     = Nothing
    , _dmeLastModified = Nothing
    }

-- | Specifies whether the object is (true) or is not (false) the latest
-- version of an object.
dmeIsLatest :: Lens' DeleteMarkerEntry (Maybe Bool)
dmeIsLatest = lens _dmeIsLatest (\s a -> s { _dmeIsLatest = a })

-- | The object key.
dmeKey :: Lens' DeleteMarkerEntry (Maybe Text)
dmeKey = lens _dmeKey (\s a -> s { _dmeKey = a })

-- | Date and time the object was last modified.
dmeLastModified :: Lens' DeleteMarkerEntry (Maybe UTCTime)
dmeLastModified = lens _dmeLastModified (\s a -> s { _dmeLastModified = a })
    . mapping _Time

dmeOwner :: Lens' DeleteMarkerEntry (Maybe Owner)
dmeOwner = lens _dmeOwner (\s a -> s { _dmeOwner = a })

-- | Version ID of an object.
dmeVersionId :: Lens' DeleteMarkerEntry (Maybe Text)
dmeVersionId = lens _dmeVersionId (\s a -> s { _dmeVersionId = a })

instance FromXML DeleteMarkerEntry where
    parseXML x = DeleteMarkerEntry
        <$> x .@? "IsLatest"
        <*> x .@? "Key"
        <*> x .@? "LastModified"
        <*> x .@? "Owner"
        <*> x .@? "VersionId"

instance ToXML DeleteMarkerEntry where
    toXML DeleteMarkerEntry{..} = nodes "DeleteMarkerEntry"
        [ "Owner"        =@ _dmeOwner
        , "Key"          =@ _dmeKey
        , "VersionId"    =@ _dmeVersionId
        , "IsLatest"     =@ _dmeIsLatest
        , "LastModified" =@ _dmeLastModified
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data ExpirationStatus
    = Disabled -- ^ Disabled
    | Enabled  -- ^ Enabled
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable ExpirationStatus

instance FromText ExpirationStatus where
    parser = match "Disabled" Disabled
         <|> match "Enabled"  Enabled

instance ToText ExpirationStatus where
    toText = \case
        Disabled -> "Disabled"
        Enabled  -> "Enabled"

instance FromXML ExpirationStatus where
    parseXML = parseXMLText "ExpirationStatus"

instance ToXML ExpirationStatus where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

data Part = Part
    { _pETag         :: Maybe Text
    , _pLastModified :: Maybe RFC822
    , _pPartNumber   :: Maybe Int
    , _pSize         :: Maybe Int
    } deriving (Eq, Ord, Show, Generic)

-- | 'Part' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'pETag' @::@ 'Maybe' 'Text'
--
-- * 'pLastModified' @::@ 'Maybe' 'UTCTime'
--
-- * 'pPartNumber' @::@ 'Maybe' 'Int'
--
-- * 'pSize' @::@ 'Maybe' 'Int'
--
part :: Part
part = Part
    { _pPartNumber   = Nothing
    , _pLastModified = Nothing
    , _pETag         = Nothing
    , _pSize         = Nothing
    }

-- | Entity tag returned when the part was uploaded.
pETag :: Lens' Part (Maybe Text)
pETag = lens _pETag (\s a -> s { _pETag = a })

-- | Date and time at which the part was uploaded.
pLastModified :: Lens' Part (Maybe UTCTime)
pLastModified = lens _pLastModified (\s a -> s { _pLastModified = a })
    . mapping _Time

-- | Part number identifying the part.
pPartNumber :: Lens' Part (Maybe Int)
pPartNumber = lens _pPartNumber (\s a -> s { _pPartNumber = a })

-- | Size of the uploaded part data.
pSize :: Lens' Part (Maybe Int)
pSize = lens _pSize (\s a -> s { _pSize = a })

instance FromXML Part where
    parseXML x = Part
        <$> x .@? "ETag"
        <*> x .@? "LastModified"
        <*> x .@? "PartNumber"
        <*> x .@? "Size"

instance ToXML Part where
    toXML Part{..} = nodes "Part"
        [ "PartNumber"   =@ _pPartNumber
        , "LastModified" =@ _pLastModified
        , "ETag"         =@ _pETag
        , "Size"         =@ _pSize
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data VersioningConfiguration = VersioningConfiguration
    { _vcMFADelete :: Maybe Text
    , _vcStatus    :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'VersioningConfiguration' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'vcMFADelete' @::@ 'Maybe' 'Text'
--
-- * 'vcStatus' @::@ 'Maybe' 'Text'
--
versioningConfiguration :: VersioningConfiguration
versioningConfiguration = VersioningConfiguration
    { _vcMFADelete = Nothing
    , _vcStatus    = Nothing
    }

-- | Specifies whether MFA delete is enabled in the bucket versioning
-- configuration. This element is only returned if the bucket has been
-- configured with MFA delete. If the bucket has never been so configured,
-- this element is not returned.
vcMFADelete :: Lens' VersioningConfiguration (Maybe Text)
vcMFADelete = lens _vcMFADelete (\s a -> s { _vcMFADelete = a })

-- | The versioning state of the bucket.
vcStatus :: Lens' VersioningConfiguration (Maybe Text)
vcStatus = lens _vcStatus (\s a -> s { _vcStatus = a })

instance FromXML VersioningConfiguration where
    parseXML x = VersioningConfiguration
        <$> x .@? "MfaDelete"
        <*> x .@? "Status"

instance ToXML VersioningConfiguration where
    toXML VersioningConfiguration{..} = nodes "VersioningConfiguration"
        [ "MfaDelete" =@ _vcMFADelete
        , "Status"    =@ _vcStatus
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data Tag = Tag
    { _tagKey   :: Text
    , _tagValue :: Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'Tag' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'tagKey' @::@ 'Text'
--
-- * 'tagValue' @::@ 'Text'
--
tag :: Text -- ^ 'tagKey'
    -> Text -- ^ 'tagValue'
    -> Tag
tag p1 p2 = Tag
    { _tagKey   = p1
    , _tagValue = p2
    }

-- | Name of the tag.
tagKey :: Lens' Tag Text
tagKey = lens _tagKey (\s a -> s { _tagKey = a })

-- | Value of the tag.
tagValue :: Lens' Tag Text
tagValue = lens _tagValue (\s a -> s { _tagValue = a })

instance FromXML Tag where
    parseXML x = Tag
        <$> x .@ "Key"
        <*> x .@ "Value"

instance ToXML Tag where
    toXML Tag{..} = nodes "Tag"
        [ "Key"   =@ _tagKey
        , "Value" =@ _tagValue
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data ObjectStorageClass
    = Glacier           -- ^ GLACIER
    | ReducedRedundancy -- ^ REDUCED_REDUNDANCY
    | Standard          -- ^ STANDARD
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable ObjectStorageClass

instance FromText ObjectStorageClass where
    parser = match "GLACIER"            Glacier
         <|> match "REDUCED_REDUNDANCY" ReducedRedundancy
         <|> match "STANDARD"           Standard

instance ToText ObjectStorageClass where
    toText = \case
        Glacier           -> "GLACIER"
        ReducedRedundancy -> "REDUCED_REDUNDANCY"
        Standard          -> "STANDARD"

instance FromXML ObjectStorageClass where
    parseXML = parseXMLText "ObjectStorageClass"

instance ToXML ObjectStorageClass where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

data MetadataDirective
    = Copy    -- ^ COPY
    | Replace -- ^ REPLACE
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable MetadataDirective

instance FromText MetadataDirective where
    parser = match "COPY"    Copy
         <|> match "REPLACE" Replace

instance ToText MetadataDirective where
    toText = \case
        Copy    -> "COPY"
        Replace -> "REPLACE"

instance FromXML MetadataDirective where
    parseXML = parseXMLText "MetadataDirective"

instance ToXML MetadataDirective where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

data RedirectAllRequestsTo = RedirectAllRequestsTo
    { _rartHostName :: Text
    , _rartProtocol :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'RedirectAllRequestsTo' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rartHostName' @::@ 'Text'
--
-- * 'rartProtocol' @::@ 'Maybe' 'Text'
--
redirectAllRequestsTo :: Text -- ^ 'rartHostName'
                      -> RedirectAllRequestsTo
redirectAllRequestsTo p1 = RedirectAllRequestsTo
    { _rartHostName = p1
    , _rartProtocol = Nothing
    }

-- | Name of the host where requests will be redirected.
rartHostName :: Lens' RedirectAllRequestsTo Text
rartHostName = lens _rartHostName (\s a -> s { _rartHostName = a })

-- | Protocol to use (http, https) when redirecting requests. The default is
-- the protocol that is used in the original request.
rartProtocol :: Lens' RedirectAllRequestsTo (Maybe Text)
rartProtocol = lens _rartProtocol (\s a -> s { _rartProtocol = a })

instance FromXML RedirectAllRequestsTo where
    parseXML x = RedirectAllRequestsTo
        <$> x .@ "HostName"
        <*> x .@? "Protocol"

instance ToXML RedirectAllRequestsTo where
    toXML RedirectAllRequestsTo{..} = nodes "RedirectAllRequestsTo"
        [ "HostName" =@ _rartHostName
        , "Protocol" =@ _rartProtocol
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data RoutingRule = RoutingRule
    { _rrCondition :: Maybe Condition
    , _rrRedirect  :: Redirect
    } deriving (Eq, Show, Generic)

-- | 'RoutingRule' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rrCondition' @::@ 'Maybe' 'Condition'
--
-- * 'rrRedirect' @::@ 'Redirect'
--
routingRule :: Redirect -- ^ 'rrRedirect'
            -> RoutingRule
routingRule p1 = RoutingRule
    { _rrRedirect  = p1
    , _rrCondition = Nothing
    }

-- | A container for describing a condition that must be met for the specified
-- redirect to apply. For example, 1. If request is for pages in the /docs
-- folder, redirect to the /documents folder. 2. If request results in HTTP
-- error 4xx, redirect request to another host where you might process the
-- error.
rrCondition :: Lens' RoutingRule (Maybe Condition)
rrCondition = lens _rrCondition (\s a -> s { _rrCondition = a })

-- | Container for redirect information. You can redirect requests to another
-- host, to another page, or with another protocol. In the event of an
-- error, you can can specify a different error code to return.
rrRedirect :: Lens' RoutingRule Redirect
rrRedirect = lens _rrRedirect (\s a -> s { _rrRedirect = a })

instance FromXML RoutingRule where
    parseXML x = RoutingRule
        <$> x .@? "Condition"
        <*> x .@ "Redirect"

instance ToXML RoutingRule where
    toXML RoutingRule{..} = nodes "RoutingRule"
        [ "Condition" =@ _rrCondition
        , "Redirect"  =@ _rrRedirect
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data NotificationConfiguration = NotificationConfiguration
    { _ncCloudFunctionConfiguration :: Maybe CloudFunctionConfiguration
    , _ncQueueConfiguration         :: Maybe QueueConfiguration
    , _ncTopicConfiguration         :: Maybe TopicConfiguration
    } deriving (Eq, Show, Generic)

-- | 'NotificationConfiguration' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ncCloudFunctionConfiguration' @::@ 'Maybe' 'CloudFunctionConfiguration'
--
-- * 'ncQueueConfiguration' @::@ 'Maybe' 'QueueConfiguration'
--
-- * 'ncTopicConfiguration' @::@ 'Maybe' 'TopicConfiguration'
--
notificationConfiguration :: NotificationConfiguration
notificationConfiguration = NotificationConfiguration
    { _ncTopicConfiguration         = Nothing
    , _ncQueueConfiguration         = Nothing
    , _ncCloudFunctionConfiguration = Nothing
    }

ncCloudFunctionConfiguration :: Lens' NotificationConfiguration (Maybe CloudFunctionConfiguration)
ncCloudFunctionConfiguration =
    lens _ncCloudFunctionConfiguration
        (\s a -> s { _ncCloudFunctionConfiguration = a })

ncQueueConfiguration :: Lens' NotificationConfiguration (Maybe QueueConfiguration)
ncQueueConfiguration =
    lens _ncQueueConfiguration (\s a -> s { _ncQueueConfiguration = a })

ncTopicConfiguration :: Lens' NotificationConfiguration (Maybe TopicConfiguration)
ncTopicConfiguration =
    lens _ncTopicConfiguration (\s a -> s { _ncTopicConfiguration = a })

instance FromXML NotificationConfiguration where
    parseXML x = NotificationConfiguration
        <$> x .@? "CloudFunctionConfiguration"
        <*> x .@? "QueueConfiguration"
        <*> x .@? "TopicConfiguration"

instance ToXML NotificationConfiguration where
    toXML NotificationConfiguration{..} = nodes "NotificationConfiguration"
        [ "TopicConfiguration"         =@ _ncTopicConfiguration
        , "QueueConfiguration"         =@ _ncQueueConfiguration
        , "CloudFunctionConfiguration" =@ _ncCloudFunctionConfiguration
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data S3ServiceError = S3ServiceError
    { _sseCode      :: Maybe Text
    , _sseKey       :: Maybe Text
    , _sseMessage   :: Maybe Text
    , _sseVersionId :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'S3ServiceError' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'sseCode' @::@ 'Maybe' 'Text'
--
-- * 'sseKey' @::@ 'Maybe' 'Text'
--
-- * 'sseMessage' @::@ 'Maybe' 'Text'
--
-- * 'sseVersionId' @::@ 'Maybe' 'Text'
--
s3ServiceError :: S3ServiceError
s3ServiceError = S3ServiceError
    { _sseKey       = Nothing
    , _sseVersionId = Nothing
    , _sseCode      = Nothing
    , _sseMessage   = Nothing
    }

sseCode :: Lens' S3ServiceError (Maybe Text)
sseCode = lens _sseCode (\s a -> s { _sseCode = a })

sseKey :: Lens' S3ServiceError (Maybe Text)
sseKey = lens _sseKey (\s a -> s { _sseKey = a })

sseMessage :: Lens' S3ServiceError (Maybe Text)
sseMessage = lens _sseMessage (\s a -> s { _sseMessage = a })

sseVersionId :: Lens' S3ServiceError (Maybe Text)
sseVersionId = lens _sseVersionId (\s a -> s { _sseVersionId = a })

instance FromXML S3ServiceError where
    parseXML x = S3ServiceError
        <$> x .@? "Code"
        <*> x .@? "Key"
        <*> x .@? "Message"
        <*> x .@? "VersionId"

instance ToXMLRoot S3ServiceError where
    toXMLRoot S3ServiceError{..} = element "S3ServiceError"
        [ "Key"       =@ _sseKey
        , "VersionId" =@ _sseVersionId
        , "Code"      =@ _sseCode
        , "Message"   =@ _sseMessage
        ]

instance ToXML S3ServiceError

data ObjectCannedACL
    = AuthenticatedRead      -- ^ authenticated-read
    | BucketOwnerFullControl -- ^ bucket-owner-full-control
    | BucketOwnerRead        -- ^ bucket-owner-read
    | Private                -- ^ private
    | PublicRead             -- ^ public-read
    | PublicReadWrite        -- ^ public-read-write
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable ObjectCannedACL

instance FromText ObjectCannedACL where
    parser = match "authenticated-read"        AuthenticatedRead
         <|> match "bucket-owner-full-control" BucketOwnerFullControl
         <|> match "bucket-owner-read"         BucketOwnerRead
         <|> match "private"                   Private
         <|> match "public-read"               PublicRead
         <|> match "public-read-write"         PublicReadWrite

instance ToText ObjectCannedACL where
    toText = \case
        AuthenticatedRead      -> "authenticated-read"
        BucketOwnerFullControl -> "bucket-owner-full-control"
        BucketOwnerRead        -> "bucket-owner-read"
        Private                -> "private"
        PublicRead             -> "public-read"
        PublicReadWrite        -> "public-read-write"

instance FromXML ObjectCannedACL where
    parseXML = parseXMLText "ObjectCannedACL"

instance ToXML ObjectCannedACL where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

data BucketVersioningStatus
    = BVSEnabled   -- ^ Enabled
    | BVSSuspended -- ^ Suspended
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable BucketVersioningStatus

instance FromText BucketVersioningStatus where
    parser = match "Enabled"   BVSEnabled
         <|> match "Suspended" BVSSuspended

instance ToText BucketVersioningStatus where
    toText = \case
        BVSEnabled   -> "Enabled"
        BVSSuspended -> "Suspended"

instance FromXML BucketVersioningStatus where
    parseXML = parseXMLText "BucketVersioningStatus"

instance ToXML BucketVersioningStatus where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

data DeletedObject = DeletedObject
    { _do1DeleteMarker          :: Maybe Bool
    , _do1DeleteMarkerVersionId :: Maybe Text
    , _do1Key                   :: Maybe Text
    , _do1VersionId             :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'DeletedObject' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'do1DeleteMarker' @::@ 'Maybe' 'Bool'
--
-- * 'do1DeleteMarkerVersionId' @::@ 'Maybe' 'Text'
--
-- * 'do1Key' @::@ 'Maybe' 'Text'
--
-- * 'do1VersionId' @::@ 'Maybe' 'Text'
--
deletedObject :: DeletedObject
deletedObject = DeletedObject
    { _do1Key                   = Nothing
    , _do1VersionId             = Nothing
    , _do1DeleteMarker          = Nothing
    , _do1DeleteMarkerVersionId = Nothing
    }

do1DeleteMarker :: Lens' DeletedObject (Maybe Bool)
do1DeleteMarker = lens _do1DeleteMarker (\s a -> s { _do1DeleteMarker = a })

do1DeleteMarkerVersionId :: Lens' DeletedObject (Maybe Text)
do1DeleteMarkerVersionId =
    lens _do1DeleteMarkerVersionId
        (\s a -> s { _do1DeleteMarkerVersionId = a })

do1Key :: Lens' DeletedObject (Maybe Text)
do1Key = lens _do1Key (\s a -> s { _do1Key = a })

do1VersionId :: Lens' DeletedObject (Maybe Text)
do1VersionId = lens _do1VersionId (\s a -> s { _do1VersionId = a })

instance FromXML DeletedObject where
    parseXML x = DeletedObject
        <$> x .@? "DeleteMarker"
        <*> x .@? "DeleteMarkerVersionId"
        <*> x .@? "Key"
        <*> x .@? "VersionId"

instance ToXML DeletedObject where
    toXML DeletedObject{..} = nodes "DeletedObject"
        [ "Key"                   =@ _do1Key
        , "VersionId"             =@ _do1VersionId
        , "DeleteMarker"          =@ _do1DeleteMarker
        , "DeleteMarkerVersionId" =@ _do1DeleteMarkerVersionId
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data ObjectVersionStorageClass
    = OVSCStandard -- ^ STANDARD
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable ObjectVersionStorageClass

instance FromText ObjectVersionStorageClass where
    parser = match "STANDARD" OVSCStandard

instance ToText ObjectVersionStorageClass where
    toText OVSCStandard = "STANDARD"

instance FromXML ObjectVersionStorageClass where
    parseXML = parseXMLText "ObjectVersionStorageClass"

instance ToXML ObjectVersionStorageClass where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

data CopyPartResult = CopyPartResult
    { _cprETag         :: Maybe Text
    , _cprLastModified :: Maybe RFC822
    } deriving (Eq, Ord, Show, Generic)

-- | 'CopyPartResult' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cprETag' @::@ 'Maybe' 'Text'
--
-- * 'cprLastModified' @::@ 'Maybe' 'UTCTime'
--
copyPartResult :: CopyPartResult
copyPartResult = CopyPartResult
    { _cprETag         = Nothing
    , _cprLastModified = Nothing
    }

-- | Entity tag of the object.
cprETag :: Lens' CopyPartResult (Maybe Text)
cprETag = lens _cprETag (\s a -> s { _cprETag = a })

-- | Date and time at which the object was uploaded.
cprLastModified :: Lens' CopyPartResult (Maybe UTCTime)
cprLastModified = lens _cprLastModified (\s a -> s { _cprLastModified = a })
    . mapping _Time

instance FromXML CopyPartResult where
    parseXML x = CopyPartResult
        <$> x .@? "ETag"
        <*> x .@? "LastModified"

instance ToXML CopyPartResult where
    toXML CopyPartResult{..} = nodes "CopyPartResult"
        [ "ETag"         =@ _cprETag
        , "LastModified" =@ _cprLastModified
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data EncodingType
    = Url -- ^ url
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable EncodingType

instance FromText EncodingType where
    parser = match "url" Url

instance ToText EncodingType where
    toText Url = "url"

instance FromXML EncodingType where
    parseXML = parseXMLText "EncodingType"

instance ToXML EncodingType where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

newtype RequestPaymentConfiguration = RequestPaymentConfiguration
    { _rpcPayer :: Text
    } deriving (Eq, Ord, Show, Generic, Monoid, IsString)

-- | 'RequestPaymentConfiguration' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rpcPayer' @::@ 'Text'
--
requestPaymentConfiguration :: Text -- ^ 'rpcPayer'
                            -> RequestPaymentConfiguration
requestPaymentConfiguration p1 = RequestPaymentConfiguration
    { _rpcPayer = p1
    }

-- | Specifies who pays for the download and request fees.
rpcPayer :: Lens' RequestPaymentConfiguration Text
rpcPayer = lens _rpcPayer (\s a -> s { _rpcPayer = a })

instance FromXML RequestPaymentConfiguration where
    parseXML x = RequestPaymentConfiguration
        <$> x .@ "Payer"

instance ToXML RequestPaymentConfiguration where
    toXML RequestPaymentConfiguration{..} = nodes "RequestPaymentConfiguration"
        [ "Payer" =@ _rpcPayer
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data CORSRule = CORSRule
    { _corsrAllowedHeaders :: List "AllowedHeader" Text
    , _corsrAllowedMethods :: List "AllowedMethod" Text
    , _corsrAllowedOrigins :: List "AllowedOrigin" Text
    , _corsrExposeHeaders  :: List "ExposeHeader" Text
    , _corsrMaxAgeSeconds  :: Maybe Int
    } deriving (Eq, Ord, Show, Generic)

-- | 'CORSRule' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'corsrAllowedHeaders' @::@ ['Text']
--
-- * 'corsrAllowedMethods' @::@ ['Text']
--
-- * 'corsrAllowedOrigins' @::@ ['Text']
--
-- * 'corsrExposeHeaders' @::@ ['Text']
--
-- * 'corsrMaxAgeSeconds' @::@ 'Maybe' 'Int'
--
corsrule :: [Text] -- ^ 'corsrAllowedHeaders'
         -> [Text] -- ^ 'corsrAllowedMethods'
         -> [Text] -- ^ 'corsrAllowedOrigins'
         -> [Text] -- ^ 'corsrExposeHeaders'
         -> CORSRule
corsrule p1 p2 p3 p4 = CORSRule
    { _corsrAllowedHeaders = withIso _List (const id) p1
    , _corsrAllowedMethods = withIso _List (const id) p2
    , _corsrAllowedOrigins = withIso _List (const id) p3
    , _corsrExposeHeaders  = withIso _List (const id) p4
    , _corsrMaxAgeSeconds  = Nothing
    }

-- | Specifies which headers are allowed in a pre-flight OPTIONS request.
corsrAllowedHeaders :: Lens' CORSRule [Text]
corsrAllowedHeaders =
    lens _corsrAllowedHeaders (\s a -> s { _corsrAllowedHeaders = a })
        . _List

-- | Identifies HTTP methods that the domain/origin specified in the rule is
-- allowed to execute.
corsrAllowedMethods :: Lens' CORSRule [Text]
corsrAllowedMethods =
    lens _corsrAllowedMethods (\s a -> s { _corsrAllowedMethods = a })
        . _List

-- | One or more origins you want customers to be able to access the bucket
-- from.
corsrAllowedOrigins :: Lens' CORSRule [Text]
corsrAllowedOrigins =
    lens _corsrAllowedOrigins (\s a -> s { _corsrAllowedOrigins = a })
        . _List

-- | One or more headers in the response that you want customers to be able to
-- access from their applications (for example, from a JavaScript
-- XMLHttpRequest object).
corsrExposeHeaders :: Lens' CORSRule [Text]
corsrExposeHeaders =
    lens _corsrExposeHeaders (\s a -> s { _corsrExposeHeaders = a })
        . _List

-- | The time in seconds that your browser is to cache the preflight response
-- for the specified resource.
corsrMaxAgeSeconds :: Lens' CORSRule (Maybe Int)
corsrMaxAgeSeconds =
    lens _corsrMaxAgeSeconds (\s a -> s { _corsrMaxAgeSeconds = a })

instance FromXML CORSRule where
    parseXML x = CORSRule
        <$> parseXML x
        <*> parseXML x
        <*> parseXML x
        <*> parseXML x
        <*> x .@? "MaxAgeSeconds"

instance ToXML CORSRule where
    toXML CORSRule{..} = nodes "CORSRule"
        [ "AllowedHeader" =@ _corsrAllowedHeaders
        , "AllowedMethod" =@ _corsrAllowedMethods
        , "AllowedOrigin" =@ _corsrAllowedOrigins
        , "ExposeHeader"  =@ _corsrExposeHeaders
        , "MaxAgeSeconds" =@ _corsrMaxAgeSeconds
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data WebsiteConfiguration = WebsiteConfiguration
    { _wcErrorDocument         :: Maybe ErrorDocument
    , _wcIndexDocument         :: Maybe IndexDocument
    , _wcRedirectAllRequestsTo :: Maybe RedirectAllRequestsTo
    , _wcRoutingRules          :: List "RoutingRule" RoutingRule
    } deriving (Eq, Show, Generic)

-- | 'WebsiteConfiguration' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'wcErrorDocument' @::@ 'Maybe' 'ErrorDocument'
--
-- * 'wcIndexDocument' @::@ 'Maybe' 'IndexDocument'
--
-- * 'wcRedirectAllRequestsTo' @::@ 'Maybe' 'RedirectAllRequestsTo'
--
-- * 'wcRoutingRules' @::@ ['RoutingRule']
--
websiteConfiguration :: WebsiteConfiguration
websiteConfiguration = WebsiteConfiguration
    { _wcErrorDocument         = Nothing
    , _wcIndexDocument         = Nothing
    , _wcRedirectAllRequestsTo = Nothing
    , _wcRoutingRules          = mempty
    }

wcErrorDocument :: Lens' WebsiteConfiguration (Maybe ErrorDocument)
wcErrorDocument = lens _wcErrorDocument (\s a -> s { _wcErrorDocument = a })

wcIndexDocument :: Lens' WebsiteConfiguration (Maybe IndexDocument)
wcIndexDocument = lens _wcIndexDocument (\s a -> s { _wcIndexDocument = a })

wcRedirectAllRequestsTo :: Lens' WebsiteConfiguration (Maybe RedirectAllRequestsTo)
wcRedirectAllRequestsTo =
    lens _wcRedirectAllRequestsTo (\s a -> s { _wcRedirectAllRequestsTo = a })

wcRoutingRules :: Lens' WebsiteConfiguration [RoutingRule]
wcRoutingRules = lens _wcRoutingRules (\s a -> s { _wcRoutingRules = a })
    . _List

instance FromXML WebsiteConfiguration where
    parseXML x = WebsiteConfiguration
        <$> x .@? "ErrorDocument"
        <*> x .@? "IndexDocument"
        <*> x .@? "RedirectAllRequestsTo"
        <*> x .@ "RoutingRules"

instance ToXML WebsiteConfiguration where
    toXML WebsiteConfiguration{..} = nodes "WebsiteConfiguration"
        [ "ErrorDocument"         =@ _wcErrorDocument
        , "IndexDocument"         =@ _wcIndexDocument
        , "RedirectAllRequestsTo" =@ _wcRedirectAllRequestsTo
        , "RoutingRules"          =@ _wcRoutingRules
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data NoncurrentVersionTransition = NoncurrentVersionTransition
    { _nvtNoncurrentDays :: Int
    , _nvtStorageClass   :: Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'NoncurrentVersionTransition' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'nvtNoncurrentDays' @::@ 'Int'
--
-- * 'nvtStorageClass' @::@ 'Text'
--
noncurrentVersionTransition :: Int -- ^ 'nvtNoncurrentDays'
                            -> Text -- ^ 'nvtStorageClass'
                            -> NoncurrentVersionTransition
noncurrentVersionTransition p1 p2 = NoncurrentVersionTransition
    { _nvtNoncurrentDays = p1
    , _nvtStorageClass   = p2
    }

-- | Specifies the number of days an object is noncurrent before Amazon S3 can
-- perform the associated action. For information about the noncurrent days
-- calculations, see How Amazon S3 Calculates When an Object Became
-- Noncurrent in the Amazon Simple Storage Service Developer Guide.
nvtNoncurrentDays :: Lens' NoncurrentVersionTransition Int
nvtNoncurrentDays =
    lens _nvtNoncurrentDays (\s a -> s { _nvtNoncurrentDays = a })

-- | The class of storage used to store the object.
nvtStorageClass :: Lens' NoncurrentVersionTransition Text
nvtStorageClass = lens _nvtStorageClass (\s a -> s { _nvtStorageClass = a })

instance FromXML NoncurrentVersionTransition where
    parseXML x = NoncurrentVersionTransition
        <$> x .@ "NoncurrentDays"
        <*> x .@ "StorageClass"

instance ToXML NoncurrentVersionTransition where
    toXML NoncurrentVersionTransition{..} = nodes "NoncurrentVersionTransition"
        [ "NoncurrentDays" =@ _nvtNoncurrentDays
        , "StorageClass"   =@ _nvtStorageClass
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data Initiator = Initiator
    { _iDisplayName :: Maybe Text
    , _iID          :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'Initiator' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'iDisplayName' @::@ 'Maybe' 'Text'
--
-- * 'iID' @::@ 'Maybe' 'Text'
--
initiator :: Initiator
initiator = Initiator
    { _iID          = Nothing
    , _iDisplayName = Nothing
    }

-- | Name of the Principal.
iDisplayName :: Lens' Initiator (Maybe Text)
iDisplayName = lens _iDisplayName (\s a -> s { _iDisplayName = a })

-- | If the principal is an AWS account, it provides the Canonical User ID. If
-- the principal is an IAM User, it provides a user ARN value.
iID :: Lens' Initiator (Maybe Text)
iID = lens _iID (\s a -> s { _iID = a })

instance FromXML Initiator where
    parseXML x = Initiator
        <$> x .@? "DisplayName"
        <*> x .@? "ID"

instance ToXML Initiator where
    toXML Initiator{..} = nodes "Initiator"
        [ "ID"          =@ _iID
        , "DisplayName" =@ _iDisplayName
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data ObjectIdentifier = ObjectIdentifier
    { _oiKey       :: Text
    , _oiVersionId :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'ObjectIdentifier' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'oiKey' @::@ 'Text'
--
-- * 'oiVersionId' @::@ 'Maybe' 'Text'
--
objectIdentifier :: Text -- ^ 'oiKey'
                 -> ObjectIdentifier
objectIdentifier p1 = ObjectIdentifier
    { _oiKey       = p1
    , _oiVersionId = Nothing
    }

-- | Key name of the object to delete.
oiKey :: Lens' ObjectIdentifier Text
oiKey = lens _oiKey (\s a -> s { _oiKey = a })

-- | VersionId for the specific version of the object to delete.
oiVersionId :: Lens' ObjectIdentifier (Maybe Text)
oiVersionId = lens _oiVersionId (\s a -> s { _oiVersionId = a })

instance FromXML ObjectIdentifier where
    parseXML x = ObjectIdentifier
        <$> x .@ "Key"
        <*> x .@? "VersionId"

instance ToXML ObjectIdentifier where
    toXML ObjectIdentifier{..} = nodes "ObjectIdentifier"
        [ "Key"       =@ _oiKey
        , "VersionId" =@ _oiVersionId
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data Bucket = Bucket
    { _bCreationDate :: Maybe RFC822
    , _bName         :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'Bucket' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'bCreationDate' @::@ 'Maybe' 'UTCTime'
--
-- * 'bName' @::@ 'Maybe' 'Text'
--
bucket :: Bucket
bucket = Bucket
    { _bName         = Nothing
    , _bCreationDate = Nothing
    }

-- | Date the bucket was created.
bCreationDate :: Lens' Bucket (Maybe UTCTime)
bCreationDate = lens _bCreationDate (\s a -> s { _bCreationDate = a })
    . mapping _Time

-- | The name of the bucket.
bName :: Lens' Bucket (Maybe Text)
bName = lens _bName (\s a -> s { _bName = a })

instance FromXML Bucket where
    parseXML x = Bucket
        <$> x .@? "CreationDate"
        <*> x .@? "Name"

instance ToXML Bucket where
    toXML Bucket{..} = nodes "Bucket"
        [ "Name"         =@ _bName
        , "CreationDate" =@ _bCreationDate
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data Protocol
    = Http  -- ^ http
    | Https -- ^ https
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable Protocol

instance FromText Protocol where
    parser = match "http"  Http
         <|> match "https" Https

instance ToText Protocol where
    toText = \case
        Http  -> "http"
        Https -> "https"

instance FromXML Protocol where
    parseXML = parseXMLText "Protocol"

instance ToXML Protocol where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

data Grant = Grant
    { _gGrantee    :: Maybe Grantee
    , _gPermission :: Maybe Text
    } deriving (Eq, Show, Generic)

-- | 'Grant' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gGrantee' @::@ 'Maybe' 'Grantee'
--
-- * 'gPermission' @::@ 'Maybe' 'Text'
--
grant :: Grant
grant = Grant
    { _gGrantee    = Nothing
    , _gPermission = Nothing
    }

gGrantee :: Lens' Grant (Maybe Grantee)
gGrantee = lens _gGrantee (\s a -> s { _gGrantee = a })

-- | Specifies the permission given to the grantee.
gPermission :: Lens' Grant (Maybe Text)
gPermission = lens _gPermission (\s a -> s { _gPermission = a })

instance FromXML Grant where
    parseXML x = Grant
        <$> x .@? "Grantee"
        <*> x .@? "Permission"

instance ToXMLRoot Grant where
    toXMLRoot Grant{..} = element "Grant"
        [ "Grantee"    =@ _gGrantee
        , "Permission" =@ _gPermission
        ]

instance ToXML Grant

data Rule = Rule
    { _rExpiration                  :: Maybe LifecycleExpiration
    , _rID                          :: Maybe Text
    , _rNoncurrentVersionExpiration :: Maybe NoncurrentVersionExpiration
    , _rNoncurrentVersionTransition :: Maybe NoncurrentVersionTransition
    , _rPrefix                      :: Text
    , _rStatus                      :: Text
    , _rTransition                  :: Maybe Transition
    } deriving (Eq, Show, Generic)

-- | 'Rule' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rExpiration' @::@ 'Maybe' 'LifecycleExpiration'
--
-- * 'rID' @::@ 'Maybe' 'Text'
--
-- * 'rNoncurrentVersionExpiration' @::@ 'Maybe' 'NoncurrentVersionExpiration'
--
-- * 'rNoncurrentVersionTransition' @::@ 'Maybe' 'NoncurrentVersionTransition'
--
-- * 'rPrefix' @::@ 'Text'
--
-- * 'rStatus' @::@ 'Text'
--
-- * 'rTransition' @::@ 'Maybe' 'Transition'
--
rule :: Text -- ^ 'rPrefix'
     -> Text -- ^ 'rStatus'
     -> Rule
rule p1 p2 = Rule
    { _rPrefix                      = p1
    , _rStatus                      = p2
    , _rExpiration                  = Nothing
    , _rID                          = Nothing
    , _rTransition                  = Nothing
    , _rNoncurrentVersionTransition = Nothing
    , _rNoncurrentVersionExpiration = Nothing
    }

rExpiration :: Lens' Rule (Maybe LifecycleExpiration)
rExpiration = lens _rExpiration (\s a -> s { _rExpiration = a })

-- | Unique identifier for the rule. The value cannot be longer than 255
-- characters.
rID :: Lens' Rule (Maybe Text)
rID = lens _rID (\s a -> s { _rID = a })

rNoncurrentVersionExpiration :: Lens' Rule (Maybe NoncurrentVersionExpiration)
rNoncurrentVersionExpiration =
    lens _rNoncurrentVersionExpiration
        (\s a -> s { _rNoncurrentVersionExpiration = a })

rNoncurrentVersionTransition :: Lens' Rule (Maybe NoncurrentVersionTransition)
rNoncurrentVersionTransition =
    lens _rNoncurrentVersionTransition
        (\s a -> s { _rNoncurrentVersionTransition = a })

-- | Prefix identifying one or more objects to which the rule applies.
rPrefix :: Lens' Rule Text
rPrefix = lens _rPrefix (\s a -> s { _rPrefix = a })

-- | If 'Enabled', the rule is currently being applied. If 'Disabled', the
-- rule is not currently being applied.
rStatus :: Lens' Rule Text
rStatus = lens _rStatus (\s a -> s { _rStatus = a })

rTransition :: Lens' Rule (Maybe Transition)
rTransition = lens _rTransition (\s a -> s { _rTransition = a })

instance FromXML Rule where
    parseXML x = Rule
        <$> x .@? "Expiration"
        <*> x .@? "ID"
        <*> x .@? "NoncurrentVersionExpiration"
        <*> x .@? "NoncurrentVersionTransition"
        <*> x .@ "Prefix"
        <*> x .@ "Status"
        <*> x .@? "Transition"

instance ToXML Rule where
    toXML Rule{..} = nodes "Rule"
        [ "Expiration"                  =@ _rExpiration
        , "ID"                          =@ _rID
        , "Prefix"                      =@ _rPrefix
        , "Status"                      =@ _rStatus
        , "Transition"                  =@ _rTransition
        , "NoncurrentVersionTransition" =@ _rNoncurrentVersionTransition
        , "NoncurrentVersionExpiration" =@ _rNoncurrentVersionExpiration
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data TopicConfiguration = TopicConfiguration
    { _tcEvent  :: Maybe Text
    , _tcEvents :: List "Event" Text
    , _tcId     :: Maybe Text
    , _tcTopic  :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'TopicConfiguration' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'tcEvent' @::@ 'Maybe' 'Text'
--
-- * 'tcEvents' @::@ ['Text']
--
-- * 'tcId' @::@ 'Maybe' 'Text'
--
-- * 'tcTopic' @::@ 'Maybe' 'Text'
--
topicConfiguration :: [Text] -- ^ 'tcEvents'
                   -> TopicConfiguration
topicConfiguration p1 = TopicConfiguration
    { _tcEvents = withIso _List (const id) p1
    , _tcId     = Nothing
    , _tcEvent  = Nothing
    , _tcTopic  = Nothing
    }

-- | Bucket event for which to send notifications.
tcEvent :: Lens' TopicConfiguration (Maybe Text)
tcEvent = lens _tcEvent (\s a -> s { _tcEvent = a })

tcEvents :: Lens' TopicConfiguration [Text]
tcEvents = lens _tcEvents (\s a -> s { _tcEvents = a })
    . _List

tcId :: Lens' TopicConfiguration (Maybe Text)
tcId = lens _tcId (\s a -> s { _tcId = a })

-- | Amazon SNS topic to which Amazon S3 will publish a message to report the
-- specified events for the bucket.
tcTopic :: Lens' TopicConfiguration (Maybe Text)
tcTopic = lens _tcTopic (\s a -> s { _tcTopic = a })

instance FromXML TopicConfiguration where
    parseXML x = TopicConfiguration
        <$> x .@? "Event"
        <*> parseXML x
        <*> x .@? "Id"
        <*> x .@? "Topic"

instance ToXML TopicConfiguration where
    toXML TopicConfiguration{..} = nodes "TopicConfiguration"
        [ "Id"    =@ _tcId
        , "Event" =@ _tcEvents
        , "Event" =@ _tcEvent
        , "Topic" =@ _tcTopic
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data QueueConfiguration = QueueConfiguration
    { _qcEvent  :: Maybe Text
    , _qcEvents :: List "Event" Text
    , _qcId     :: Maybe Text
    , _qcQueue  :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'QueueConfiguration' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'qcEvent' @::@ 'Maybe' 'Text'
--
-- * 'qcEvents' @::@ ['Text']
--
-- * 'qcId' @::@ 'Maybe' 'Text'
--
-- * 'qcQueue' @::@ 'Maybe' 'Text'
--
queueConfiguration :: [Text] -- ^ 'qcEvents'
                   -> QueueConfiguration
queueConfiguration p1 = QueueConfiguration
    { _qcEvents = withIso _List (const id) p1
    , _qcId     = Nothing
    , _qcEvent  = Nothing
    , _qcQueue  = Nothing
    }

qcEvent :: Lens' QueueConfiguration (Maybe Text)
qcEvent = lens _qcEvent (\s a -> s { _qcEvent = a })

qcEvents :: Lens' QueueConfiguration [Text]
qcEvents = lens _qcEvents (\s a -> s { _qcEvents = a })
    . _List

qcId :: Lens' QueueConfiguration (Maybe Text)
qcId = lens _qcId (\s a -> s { _qcId = a })

qcQueue :: Lens' QueueConfiguration (Maybe Text)
qcQueue = lens _qcQueue (\s a -> s { _qcQueue = a })

instance FromXML QueueConfiguration where
    parseXML x = QueueConfiguration
        <$> x .@? "Event"
        <*> parseXML x
        <*> x .@? "Id"
        <*> x .@? "Queue"

instance ToXML QueueConfiguration where
    toXML QueueConfiguration{..} = nodes "QueueConfiguration"
        [ "Id"    =@ _qcId
        , "Event" =@ _qcEvent
        , "Event" =@ _qcEvents
        , "Queue" =@ _qcQueue
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data Owner = Owner
    { _oDisplayName :: Maybe Text
    , _oID          :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'Owner' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'oDisplayName' @::@ 'Maybe' 'Text'
--
-- * 'oID' @::@ 'Maybe' 'Text'
--
owner :: Owner
owner = Owner
    { _oDisplayName = Nothing
    , _oID          = Nothing
    }

oDisplayName :: Lens' Owner (Maybe Text)
oDisplayName = lens _oDisplayName (\s a -> s { _oDisplayName = a })

oID :: Lens' Owner (Maybe Text)
oID = lens _oID (\s a -> s { _oID = a })

instance FromXML Owner where
    parseXML x = Owner
        <$> x .@? "DisplayName"
        <*> x .@? "ID"

instance ToXMLRoot Owner where
    toXMLRoot Owner{..} = element "Owner"
        [ "DisplayName" =@ _oDisplayName
        , "ID"          =@ _oID
        ]

instance ToXML Owner

newtype BucketLoggingStatus = BucketLoggingStatus
    { _blsLoggingEnabled :: Maybe LoggingEnabled
    } deriving (Eq, Show, Generic)

-- | 'BucketLoggingStatus' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'blsLoggingEnabled' @::@ 'Maybe' 'LoggingEnabled'
--
bucketLoggingStatus :: BucketLoggingStatus
bucketLoggingStatus = BucketLoggingStatus
    { _blsLoggingEnabled = Nothing
    }

blsLoggingEnabled :: Lens' BucketLoggingStatus (Maybe LoggingEnabled)
blsLoggingEnabled =
    lens _blsLoggingEnabled (\s a -> s { _blsLoggingEnabled = a })

instance FromXML BucketLoggingStatus where
    parseXML x = BucketLoggingStatus
        <$> x .@? "LoggingEnabled"

instance ToXML BucketLoggingStatus where
    toXML BucketLoggingStatus{..} = nodes "BucketLoggingStatus"
        [ "LoggingEnabled" =@ _blsLoggingEnabled
        ]


How to deal with flattened? Should be merged directly into the current nodeset

newtype ErrorDocument = ErrorDocument
    { _edKey :: Text
    } deriving (Eq, Ord, Show, Generic, Monoid, IsString)

-- | 'ErrorDocument' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'edKey' @::@ 'Text'
--
errorDocument :: Text -- ^ 'edKey'
              -> ErrorDocument
errorDocument p1 = ErrorDocument
    { _edKey = p1
    }

-- | The object key name to use when a 4XX class error occurs.
edKey :: Lens' ErrorDocument Text
edKey = lens _edKey (\s a -> s { _edKey = a })

instance FromXML ErrorDocument where
    parseXML x = ErrorDocument
        <$> x .@ "Key"

instance ToXML ErrorDocument where
    toXML ErrorDocument{..} = nodes "ErrorDocument"
        [ "Key" =@ _edKey
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data StorageClass
    = SCReducedRedundancy -- ^ REDUCED_REDUNDANCY
    | SCStandard          -- ^ STANDARD
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable StorageClass

instance FromText StorageClass where
    parser = match "REDUCED_REDUNDANCY" SCReducedRedundancy
         <|> match "STANDARD"           SCStandard

instance ToText StorageClass where
    toText = \case
        SCReducedRedundancy -> "REDUCED_REDUNDANCY"
        SCStandard          -> "STANDARD"

instance FromXML StorageClass where
    parseXML = parseXMLText "StorageClass"

instance ToXML StorageClass where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

data ObjectVersion = ObjectVersion
    { _ovETag         :: Maybe Text
    , _ovIsLatest     :: Maybe Bool
    , _ovKey          :: Maybe Text
    , _ovLastModified :: Maybe RFC822
    , _ovOwner        :: Maybe Owner
    , _ovSize         :: Maybe Int
    , _ovStorageClass :: Maybe Text
    , _ovVersionId    :: Maybe Text
    } deriving (Eq, Show, Generic)

-- | 'ObjectVersion' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ovETag' @::@ 'Maybe' 'Text'
--
-- * 'ovIsLatest' @::@ 'Maybe' 'Bool'
--
-- * 'ovKey' @::@ 'Maybe' 'Text'
--
-- * 'ovLastModified' @::@ 'Maybe' 'UTCTime'
--
-- * 'ovOwner' @::@ 'Maybe' 'Owner'
--
-- * 'ovSize' @::@ 'Maybe' 'Int'
--
-- * 'ovStorageClass' @::@ 'Maybe' 'Text'
--
-- * 'ovVersionId' @::@ 'Maybe' 'Text'
--
objectVersion :: ObjectVersion
objectVersion = ObjectVersion
    { _ovETag         = Nothing
    , _ovSize         = Nothing
    , _ovStorageClass = Nothing
    , _ovKey          = Nothing
    , _ovVersionId    = Nothing
    , _ovIsLatest     = Nothing
    , _ovLastModified = Nothing
    , _ovOwner        = Nothing
    }

ovETag :: Lens' ObjectVersion (Maybe Text)
ovETag = lens _ovETag (\s a -> s { _ovETag = a })

-- | Specifies whether the object is (true) or is not (false) the latest
-- version of an object.
ovIsLatest :: Lens' ObjectVersion (Maybe Bool)
ovIsLatest = lens _ovIsLatest (\s a -> s { _ovIsLatest = a })

-- | The object key.
ovKey :: Lens' ObjectVersion (Maybe Text)
ovKey = lens _ovKey (\s a -> s { _ovKey = a })

-- | Date and time the object was last modified.
ovLastModified :: Lens' ObjectVersion (Maybe UTCTime)
ovLastModified = lens _ovLastModified (\s a -> s { _ovLastModified = a })
    . mapping _Time

ovOwner :: Lens' ObjectVersion (Maybe Owner)
ovOwner = lens _ovOwner (\s a -> s { _ovOwner = a })

-- | Size in bytes of the object.
ovSize :: Lens' ObjectVersion (Maybe Int)
ovSize = lens _ovSize (\s a -> s { _ovSize = a })

-- | The class of storage used to store the object.
ovStorageClass :: Lens' ObjectVersion (Maybe Text)
ovStorageClass = lens _ovStorageClass (\s a -> s { _ovStorageClass = a })

-- | Version ID of an object.
ovVersionId :: Lens' ObjectVersion (Maybe Text)
ovVersionId = lens _ovVersionId (\s a -> s { _ovVersionId = a })

instance FromXML ObjectVersion where
    parseXML x = ObjectVersion
        <$> x .@? "ETag"
        <*> x .@? "IsLatest"
        <*> x .@? "Key"
        <*> x .@? "LastModified"
        <*> x .@? "Owner"
        <*> x .@? "Size"
        <*> x .@? "StorageClass"
        <*> x .@? "VersionId"

instance ToXML ObjectVersion where
    toXML ObjectVersion{..} = nodes "ObjectVersion"
        [ "ETag"         =@ _ovETag
        , "Size"         =@ _ovSize
        , "StorageClass" =@ _ovStorageClass
        , "Key"          =@ _ovKey
        , "VersionId"    =@ _ovVersionId
        , "IsLatest"     =@ _ovIsLatest
        , "LastModified" =@ _ovLastModified
        , "Owner"        =@ _ovOwner
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data TargetGrant = TargetGrant
    { _tgGrantee    :: Maybe Grantee
    , _tgPermission :: Maybe Text
    } deriving (Eq, Show, Generic)

-- | 'TargetGrant' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'tgGrantee' @::@ 'Maybe' 'Grantee'
--
-- * 'tgPermission' @::@ 'Maybe' 'Text'
--
targetGrant :: TargetGrant
targetGrant = TargetGrant
    { _tgGrantee    = Nothing
    , _tgPermission = Nothing
    }

tgGrantee :: Lens' TargetGrant (Maybe Grantee)
tgGrantee = lens _tgGrantee (\s a -> s { _tgGrantee = a })

-- | Logging permissions assigned to the Grantee for the bucket.
tgPermission :: Lens' TargetGrant (Maybe Text)
tgPermission = lens _tgPermission (\s a -> s { _tgPermission = a })

instance FromXML TargetGrant where
    parseXML x = TargetGrant
        <$> x .@? "Grantee"
        <*> x .@? "Permission"

instance ToXML TargetGrant where
    toXML TargetGrant{..} = nodes "TargetGrant"
        [ "Grantee"    =@ _tgGrantee
        , "Permission" =@ _tgPermission
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data MFADeleteStatus
    = MFADSDisabled -- ^ Disabled
    | MFADSEnabled  -- ^ Enabled
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable MFADeleteStatus

instance FromText MFADeleteStatus where
    parser = match "Disabled" MFADSDisabled
         <|> match "Enabled"  MFADSEnabled

instance ToText MFADeleteStatus where
    toText = \case
        MFADSDisabled -> "Disabled"
        MFADSEnabled  -> "Enabled"

instance FromXML MFADeleteStatus where
    parseXML = parseXMLText "MFADeleteStatus"

instance ToXML MFADeleteStatus where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

data Payer
    = BucketOwner -- ^ BucketOwner
    | Requester   -- ^ Requester
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable Payer

instance FromText Payer where
    parser = match "BucketOwner" BucketOwner
         <|> match "Requester"   Requester

instance ToText Payer where
    toText = \case
        BucketOwner -> "BucketOwner"
        Requester   -> "Requester"

instance FromXML Payer where
    parseXML = parseXMLText "Payer"

instance ToXML Payer where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

data Redirect = Redirect
    { _rHostName             :: Maybe Text
    , _rHttpRedirectCode     :: Maybe Text
    , _rProtocol             :: Maybe Text
    , _rReplaceKeyPrefixWith :: Maybe Text
    , _rReplaceKeyWith       :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'Redirect' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rHostName' @::@ 'Maybe' 'Text'
--
-- * 'rHttpRedirectCode' @::@ 'Maybe' 'Text'
--
-- * 'rProtocol' @::@ 'Maybe' 'Text'
--
-- * 'rReplaceKeyPrefixWith' @::@ 'Maybe' 'Text'
--
-- * 'rReplaceKeyWith' @::@ 'Maybe' 'Text'
--
redirect :: Redirect
redirect = Redirect
    { _rHostName             = Nothing
    , _rHttpRedirectCode     = Nothing
    , _rProtocol             = Nothing
    , _rReplaceKeyPrefixWith = Nothing
    , _rReplaceKeyWith       = Nothing
    }

-- | The host name to use in the redirect request.
rHostName :: Lens' Redirect (Maybe Text)
rHostName = lens _rHostName (\s a -> s { _rHostName = a })

-- | The HTTP redirect code to use on the response. Not required if one of the
-- siblings is present.
rHttpRedirectCode :: Lens' Redirect (Maybe Text)
rHttpRedirectCode =
    lens _rHttpRedirectCode (\s a -> s { _rHttpRedirectCode = a })

-- | Protocol to use (http, https) when redirecting requests. The default is
-- the protocol that is used in the original request.
rProtocol :: Lens' Redirect (Maybe Text)
rProtocol = lens _rProtocol (\s a -> s { _rProtocol = a })

-- | The object key prefix to use in the redirect request. For example, to
-- redirect requests for all pages with prefix docs/ (objects in the docs/
-- folder) to documents/, you can set a condition block with KeyPrefixEquals
-- set to docs/ and in the Redirect set ReplaceKeyPrefixWith to /documents.
-- Not required if one of the siblings is present. Can be present only if
-- ReplaceKeyWith is not provided.
rReplaceKeyPrefixWith :: Lens' Redirect (Maybe Text)
rReplaceKeyPrefixWith =
    lens _rReplaceKeyPrefixWith (\s a -> s { _rReplaceKeyPrefixWith = a })

-- | The specific object key to use in the redirect request. For example,
-- redirect request to error.html. Not required if one of the sibling is
-- present. Can be present only if ReplaceKeyPrefixWith is not provided.
rReplaceKeyWith :: Lens' Redirect (Maybe Text)
rReplaceKeyWith = lens _rReplaceKeyWith (\s a -> s { _rReplaceKeyWith = a })

instance FromXML Redirect where
    parseXML x = Redirect
        <$> x .@? "HostName"
        <*> x .@? "HttpRedirectCode"
        <*> x .@? "Protocol"
        <*> x .@? "ReplaceKeyPrefixWith"
        <*> x .@? "ReplaceKeyWith"

instance ToXML Redirect where
    toXML Redirect{..} = nodes "Redirect"
        [ "HostName"             =@ _rHostName
        , "HttpRedirectCode"     =@ _rHttpRedirectCode
        , "Protocol"             =@ _rProtocol
        , "ReplaceKeyPrefixWith" =@ _rReplaceKeyPrefixWith
        , "ReplaceKeyWith"       =@ _rReplaceKeyWith
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data BucketLogsPermission
    = FullControl -- ^ FULL_CONTROL
    | Read        -- ^ READ
    | Write       -- ^ WRITE
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable BucketLogsPermission

instance FromText BucketLogsPermission where
    parser = match "FULL_CONTROL" FullControl
         <|> match "READ"         Read
         <|> match "WRITE"        Write

instance ToText BucketLogsPermission where
    toText = \case
        FullControl -> "FULL_CONTROL"
        Read        -> "READ"
        Write       -> "WRITE"

instance FromXML BucketLogsPermission where
    parseXML = parseXMLText "BucketLogsPermission"

instance ToXML BucketLogsPermission where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

data CompletedPart = CompletedPart
    { _cpETag       :: Maybe Text
    , _cpPartNumber :: Maybe Int
    } deriving (Eq, Ord, Show, Generic)

-- | 'CompletedPart' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cpETag' @::@ 'Maybe' 'Text'
--
-- * 'cpPartNumber' @::@ 'Maybe' 'Int'
--
completedPart :: CompletedPart
completedPart = CompletedPart
    { _cpETag       = Nothing
    , _cpPartNumber = Nothing
    }

-- | Entity tag returned when the part was uploaded.
cpETag :: Lens' CompletedPart (Maybe Text)
cpETag = lens _cpETag (\s a -> s { _cpETag = a })

-- | Part number that identifies the part.
cpPartNumber :: Lens' CompletedPart (Maybe Int)
cpPartNumber = lens _cpPartNumber (\s a -> s { _cpPartNumber = a })

instance FromXML CompletedPart where
    parseXML x = CompletedPart
        <$> x .@? "ETag"
        <*> x .@? "PartNumber"

instance ToXML CompletedPart where
    toXML CompletedPart{..} = nodes "CompletedPart"
        [ "ETag"       =@ _cpETag
        , "PartNumber" =@ _cpPartNumber
        ]


How to deal with flattened? Should be merged directly into the current nodeset

newtype CreateBucketConfiguration = CreateBucketConfiguration
    { _cbcLocationConstraint :: Maybe Text
    } deriving (Eq, Ord, Show, Generic, Monoid)

-- | 'CreateBucketConfiguration' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cbcLocationConstraint' @::@ 'Maybe' 'Text'
--
createBucketConfiguration :: CreateBucketConfiguration
createBucketConfiguration = CreateBucketConfiguration
    { _cbcLocationConstraint = Nothing
    }

-- | Specifies the region where the bucket will be created.
cbcLocationConstraint :: Lens' CreateBucketConfiguration (Maybe Text)
cbcLocationConstraint =
    lens _cbcLocationConstraint (\s a -> s { _cbcLocationConstraint = a })

instance FromXML CreateBucketConfiguration where
    parseXML x = CreateBucketConfiguration
        <$> x .@? "LocationConstraint"

instance ToXML CreateBucketConfiguration where
    toXML CreateBucketConfiguration{..} = nodes "CreateBucketConfiguration"
        [ "LocationConstraint" =@ _cbcLocationConstraint
        ]


How to deal with flattened? Should be merged directly into the current nodeset

newtype Tagging = Tagging
    { _tTagSet :: List "Tag" Tag
    } deriving (Eq, Show, Generic, Monoid, Semigroup)

instance GHC.Exts.IsList Tagging where
    type Item Tagging = Tag

    fromList = Tagging . GHC.Exts.fromList
    toList   = GHC.Exts.toList . _tTagSet

-- | 'Tagging' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'tTagSet' @::@ ['Tag']
--
tagging :: Tagging
tagging = Tagging
    { _tTagSet = mempty
    }

tTagSet :: Lens' Tagging [Tag]
tTagSet = lens _tTagSet (\s a -> s { _tTagSet = a })
    . _List

instance FromXML Tagging where
    parseXML x = Tagging
        <$> x .@ "TagSet"

instance ToXML Tagging where
    toXML Tagging{..} = nodes "Tagging"
        [ "TagSet" =@ _tTagSet
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data LifecycleExpiration = LifecycleExpiration
    { _leDate :: Maybe ISO8601
    , _leDays :: Maybe Int
    } deriving (Eq, Ord, Show, Generic)

-- | 'LifecycleExpiration' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'leDate' @::@ 'Maybe' 'UTCTime'
--
-- * 'leDays' @::@ 'Maybe' 'Int'
--
lifecycleExpiration :: LifecycleExpiration
lifecycleExpiration = LifecycleExpiration
    { _leDate = Nothing
    , _leDays = Nothing
    }

-- | Indicates at what date the object is to be moved or deleted. Should be in
-- GMT ISO 8601 Format.
leDate :: Lens' LifecycleExpiration (Maybe UTCTime)
leDate = lens _leDate (\s a -> s { _leDate = a })
    . mapping _Time

-- | Indicates the lifetime, in days, of the objects that are subject to the
-- rule. The value must be a non-zero positive integer.
leDays :: Lens' LifecycleExpiration (Maybe Int)
leDays = lens _leDays (\s a -> s { _leDays = a })

instance FromXML LifecycleExpiration where
    parseXML x = LifecycleExpiration
        <$> x .@? "Date"
        <*> x .@? "Days"

instance ToXML LifecycleExpiration where
    toXML LifecycleExpiration{..} = nodes "LifecycleExpiration"
        [ "Date" =@ _leDate
        , "Days" =@ _leDays
        ]


How to deal with flattened? Should be merged directly into the current nodeset

newtype CORSConfiguration = CORSConfiguration
    { _corscCORSRules :: List "CORSRule" CORSRule
    } deriving (Eq, Show, Generic, Monoid, Semigroup)

-- | 'CORSConfiguration' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'corscCORSRules' @::@ ['CORSRule']
--
corsconfiguration :: [CORSRule] -- ^ 'corscCORSRules'
                  -> CORSConfiguration
corsconfiguration p1 = CORSConfiguration
    { _corscCORSRules = withIso _List (const id) p1
    }

corscCORSRules :: Lens' CORSConfiguration [CORSRule]
corscCORSRules = lens _corscCORSRules (\s a -> s { _corscCORSRules = a })
    . _List

instance FromXML CORSConfiguration where
    parseXML x = CORSConfiguration
        <$> parseXML x

instance ToXML CORSConfiguration where
    toXML CORSConfiguration{..} = nodes "CORSConfiguration"
        [ "CORSRule" =@ _corscCORSRules
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data Object = Object
    { _oETag         :: Text
    , _oKey          :: Text
    , _oLastModified :: RFC822
    , _oOwner        :: Owner
    , _oSize         :: Int
    , _oStorageClass :: Text
    } deriving (Eq, Show, Generic)

-- | 'Object' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'oETag' @::@ 'Text'
--
-- * 'oKey' @::@ 'Text'
--
-- * 'oLastModified' @::@ 'UTCTime'
--
-- * 'oOwner' @::@ 'Owner'
--
-- * 'oSize' @::@ 'Int'
--
-- * 'oStorageClass' @::@ 'Text'
--
object' :: Text -- ^ 'oKey'
        -> UTCTime -- ^ 'oLastModified'
        -> Text -- ^ 'oETag'
        -> Int -- ^ 'oSize'
        -> Text -- ^ 'oStorageClass'
        -> Owner -- ^ 'oOwner'
        -> Object
object' p1 p2 p3 p4 p5 p6 = Object
    { _oKey          = p1
    , _oLastModified = withIso _Time (const id) p2
    , _oETag         = p3
    , _oSize         = p4
    , _oStorageClass = p5
    , _oOwner        = p6
    }

oETag :: Lens' Object Text
oETag = lens _oETag (\s a -> s { _oETag = a })

oKey :: Lens' Object Text
oKey = lens _oKey (\s a -> s { _oKey = a })

oLastModified :: Lens' Object UTCTime
oLastModified = lens _oLastModified (\s a -> s { _oLastModified = a })
    . _Time

oOwner :: Lens' Object Owner
oOwner = lens _oOwner (\s a -> s { _oOwner = a })

oSize :: Lens' Object Int
oSize = lens _oSize (\s a -> s { _oSize = a })

-- | The class of storage used to store the object.
oStorageClass :: Lens' Object Text
oStorageClass = lens _oStorageClass (\s a -> s { _oStorageClass = a })

instance FromXML Object where
    parseXML x = Object
        <$> x .@ "ETag"
        <*> x .@ "Key"
        <*> x .@ "LastModified"
        <*> x .@ "Owner"
        <*> x .@ "Size"
        <*> x .@ "StorageClass"

instance ToXML Object where
    toXML Object{..} = nodes "Object"
        [ "Key"          =@ _oKey
        , "LastModified" =@ _oLastModified
        , "ETag"         =@ _oETag
        , "Size"         =@ _oSize
        , "StorageClass" =@ _oStorageClass
        , "Owner"        =@ _oOwner
        ]


How to deal with flattened? Should be merged directly into the current nodeset

newtype CommonPrefix = CommonPrefix
    { _cpPrefix :: Maybe Text
    } deriving (Eq, Ord, Show, Generic, Monoid)

-- | 'CommonPrefix' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cpPrefix' @::@ 'Maybe' 'Text'
--
commonPrefix :: CommonPrefix
commonPrefix = CommonPrefix
    { _cpPrefix = Nothing
    }

cpPrefix :: Lens' CommonPrefix (Maybe Text)
cpPrefix = lens _cpPrefix (\s a -> s { _cpPrefix = a })

instance FromXML CommonPrefix where
    parseXML x = CommonPrefix
        <$> x .@? "Prefix"

instance ToXMLRoot CommonPrefix where
    toXMLRoot CommonPrefix{..} = element "CommonPrefix"
        [ "Prefix" =@ _cpPrefix
        ]

instance ToXML CommonPrefix

data MultipartUpload = MultipartUpload
    { _muInitiated    :: Maybe RFC822
    , _muInitiator    :: Maybe Initiator
    , _muKey          :: Maybe Text
    , _muOwner        :: Maybe Owner
    , _muStorageClass :: Maybe Text
    , _muUploadId     :: Maybe Text
    } deriving (Eq, Show, Generic)

-- | 'MultipartUpload' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'muInitiated' @::@ 'Maybe' 'UTCTime'
--
-- * 'muInitiator' @::@ 'Maybe' 'Initiator'
--
-- * 'muKey' @::@ 'Maybe' 'Text'
--
-- * 'muOwner' @::@ 'Maybe' 'Owner'
--
-- * 'muStorageClass' @::@ 'Maybe' 'Text'
--
-- * 'muUploadId' @::@ 'Maybe' 'Text'
--
multipartUpload :: MultipartUpload
multipartUpload = MultipartUpload
    { _muUploadId     = Nothing
    , _muKey          = Nothing
    , _muInitiated    = Nothing
    , _muStorageClass = Nothing
    , _muOwner        = Nothing
    , _muInitiator    = Nothing
    }

-- | Date and time at which the multipart upload was initiated.
muInitiated :: Lens' MultipartUpload (Maybe UTCTime)
muInitiated = lens _muInitiated (\s a -> s { _muInitiated = a })
    . mapping _Time

-- | Identifies who initiated the multipart upload.
muInitiator :: Lens' MultipartUpload (Maybe Initiator)
muInitiator = lens _muInitiator (\s a -> s { _muInitiator = a })

-- | Key of the object for which the multipart upload was initiated.
muKey :: Lens' MultipartUpload (Maybe Text)
muKey = lens _muKey (\s a -> s { _muKey = a })

muOwner :: Lens' MultipartUpload (Maybe Owner)
muOwner = lens _muOwner (\s a -> s { _muOwner = a })

-- | The class of storage used to store the object.
muStorageClass :: Lens' MultipartUpload (Maybe Text)
muStorageClass = lens _muStorageClass (\s a -> s { _muStorageClass = a })

-- | Upload ID that identifies the multipart upload.
muUploadId :: Lens' MultipartUpload (Maybe Text)
muUploadId = lens _muUploadId (\s a -> s { _muUploadId = a })

instance FromXML MultipartUpload where
    parseXML x = MultipartUpload
        <$> x .@? "Initiated"
        <*> x .@? "Initiator"
        <*> x .@? "Key"
        <*> x .@? "Owner"
        <*> x .@? "StorageClass"
        <*> x .@? "UploadId"

instance ToXML MultipartUpload where
    toXML MultipartUpload{..} = nodes "MultipartUpload"
        [ "UploadId"     =@ _muUploadId
        , "Key"          =@ _muKey
        , "Initiated"    =@ _muInitiated
        , "StorageClass" =@ _muStorageClass
        , "Owner"        =@ _muOwner
        , "Initiator"    =@ _muInitiator
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data Type
    = AmazonCustomerByEmail -- ^ AmazonCustomerByEmail
    | CanonicalUser         -- ^ CanonicalUser
    | Group                 -- ^ Group
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable Type

instance FromText Type where
    parser = match "AmazonCustomerByEmail" AmazonCustomerByEmail
         <|> match "CanonicalUser"         CanonicalUser
         <|> match "Group"                 Group

instance ToText Type where
    toText = \case
        AmazonCustomerByEmail -> "AmazonCustomerByEmail"
        CanonicalUser         -> "CanonicalUser"
        Group                 -> "Group"

instance FromXML Type where
    parseXML = parseXMLText "Type"

instance ToXML Type where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

data TransitionStorageClass
    = TSCGlacier -- ^ GLACIER
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable TransitionStorageClass

instance FromText TransitionStorageClass where
    parser = match "GLACIER" TSCGlacier

instance ToText TransitionStorageClass where
    toText TSCGlacier = "GLACIER"

instance FromXML TransitionStorageClass where
    parseXML = parseXMLText "TransitionStorageClass"

instance ToXML TransitionStorageClass where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

newtype CompletedMultipartUpload = CompletedMultipartUpload
    { _cmuParts :: List "Part" CompletedPart
    } deriving (Eq, Show, Generic, Monoid, Semigroup)

-- | 'CompletedMultipartUpload' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cmuParts' @::@ ['CompletedPart']
--
completedMultipartUpload :: [CompletedPart] -- ^ 'cmuParts'
                         -> CompletedMultipartUpload
completedMultipartUpload p1 = CompletedMultipartUpload
    { _cmuParts = withIso _List (const id) p1
    }

cmuParts :: Lens' CompletedMultipartUpload [CompletedPart]
cmuParts = lens _cmuParts (\s a -> s { _cmuParts = a })
    . _List

instance FromXML CompletedMultipartUpload where
    parseXML x = CompletedMultipartUpload
        <$> parseXML x

instance ToXML CompletedMultipartUpload where
    toXML CompletedMultipartUpload{..} = nodes "CompletedMultipartUpload"
        [ "Part" =@ _cmuParts
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data Condition = Condition
    { _cHttpErrorCodeReturnedEquals :: Maybe Text
    , _cKeyPrefixEquals             :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'Condition' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cHttpErrorCodeReturnedEquals' @::@ 'Maybe' 'Text'
--
-- * 'cKeyPrefixEquals' @::@ 'Maybe' 'Text'
--
condition :: Condition
condition = Condition
    { _cHttpErrorCodeReturnedEquals = Nothing
    , _cKeyPrefixEquals             = Nothing
    }

-- | The HTTP error code when the redirect is applied. In the event of an
-- error, if the error code equals this value, then the specified redirect
-- is applied. Required when parent element Condition is specified and
-- sibling KeyPrefixEquals is not specified. If both are specified, then
-- both must be true for the redirect to be applied.
cHttpErrorCodeReturnedEquals :: Lens' Condition (Maybe Text)
cHttpErrorCodeReturnedEquals =
    lens _cHttpErrorCodeReturnedEquals
        (\s a -> s { _cHttpErrorCodeReturnedEquals = a })

-- | The object key name prefix when the redirect is applied. For example, to
-- redirect requests for ExamplePage.html, the key prefix will be
-- ExamplePage.html. To redirect request for all pages with the prefix
-- docs/, the key prefix will be /docs, which identifies all objects in the
-- docs/ folder. Required when the parent element Condition is specified and
-- sibling HttpErrorCodeReturnedEquals is not specified. If both conditions
-- are specified, both must be true for the redirect to be applied.
cKeyPrefixEquals :: Lens' Condition (Maybe Text)
cKeyPrefixEquals = lens _cKeyPrefixEquals (\s a -> s { _cKeyPrefixEquals = a })

instance FromXML Condition where
    parseXML x = Condition
        <$> x .@? "HttpErrorCodeReturnedEquals"
        <*> x .@? "KeyPrefixEquals"

instance ToXML Condition where
    toXML Condition{..} = nodes "Condition"
        [ "HttpErrorCodeReturnedEquals" =@ _cHttpErrorCodeReturnedEquals
        , "KeyPrefixEquals"             =@ _cKeyPrefixEquals
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data Permission
    = PFullControl -- ^ FULL_CONTROL
    | PRead        -- ^ READ
    | PReadAcp     -- ^ READ_ACP
    | PWrite       -- ^ WRITE
    | PWriteAcp    -- ^ WRITE_ACP
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable Permission

instance FromText Permission where
    parser = match "FULL_CONTROL" PFullControl
         <|> match "READ"         PRead
         <|> match "READ_ACP"     PReadAcp
         <|> match "WRITE"        PWrite
         <|> match "WRITE_ACP"    PWriteAcp

instance ToText Permission where
    toText = \case
        PFullControl -> "FULL_CONTROL"
        PRead        -> "READ"
        PReadAcp     -> "READ_ACP"
        PWrite       -> "WRITE"
        PWriteAcp    -> "WRITE_ACP"

instance FromXML Permission where
    parseXML = parseXMLText "Permission"

instance ToXML Permission where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

data AccessControlPolicy = AccessControlPolicy
    { _acpGrants :: List "Grant" Grant
    , _acpOwner  :: Maybe Owner
    } deriving (Eq, Show, Generic)

-- | 'AccessControlPolicy' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'acpGrants' @::@ ['Grant']
--
-- * 'acpOwner' @::@ 'Maybe' 'Owner'
--
accessControlPolicy :: AccessControlPolicy
accessControlPolicy = AccessControlPolicy
    { _acpGrants = mempty
    , _acpOwner  = Nothing
    }

-- | A list of grants.
acpGrants :: Lens' AccessControlPolicy [Grant]
acpGrants = lens _acpGrants (\s a -> s { _acpGrants = a })
    . _List

acpOwner :: Lens' AccessControlPolicy (Maybe Owner)
acpOwner = lens _acpOwner (\s a -> s { _acpOwner = a })

instance FromXML AccessControlPolicy where
    parseXML x = AccessControlPolicy
        <$> x .@ "AccessControlList"
        <*> x .@? "Owner"

instance ToXMLRoot AccessControlPolicy where
    toXMLRoot AccessControlPolicy{..} = element "AccessControlPolicy"
        [ "AccessControlList" =@ _acpGrants
        , "Owner"             =@ _acpOwner
        ]

instance ToXML AccessControlPolicy

data BucketCannedACL
    = CannedAuthenticatedRead -- ^ authenticated-read
    | CannedPrivate           -- ^ private
    | CannedPublicRead        -- ^ public-read
    | CannedPublicReadWrite   -- ^ public-read-write
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable BucketCannedACL

instance FromText BucketCannedACL where
    parser = match "authenticated-read" CannedAuthenticatedRead
         <|> match "private"            CannedPrivate
         <|> match "public-read"        CannedPublicRead
         <|> match "public-read-write"  CannedPublicReadWrite

instance ToText BucketCannedACL where
    toText = \case
        CannedAuthenticatedRead -> "authenticated-read"
        CannedPrivate           -> "private"
        CannedPublicRead        -> "public-read"
        CannedPublicReadWrite   -> "public-read-write"

instance FromXML BucketCannedACL where
    parseXML = parseXMLText "BucketCannedACL"

instance ToXML BucketCannedACL where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

data MFADelete
    = MFADDisabled -- ^ Disabled
    | MFADEnabled  -- ^ Enabled
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable MFADelete

instance FromText MFADelete where
    parser = match "Disabled" MFADDisabled
         <|> match "Enabled"  MFADEnabled

instance ToText MFADelete where
    toText = \case
        MFADDisabled -> "Disabled"
        MFADEnabled  -> "Enabled"

instance FromXML MFADelete where
    parseXML = parseXMLText "MFADelete"

instance ToXML MFADelete where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

data CloudFunctionConfiguration = CloudFunctionConfiguration
    { _cfcCloudFunction  :: Maybe Text
    , _cfcEvent          :: Maybe Text
    , _cfcEvents         :: List "Event" Text
    , _cfcId             :: Maybe Text
    , _cfcInvocationRole :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'CloudFunctionConfiguration' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cfcCloudFunction' @::@ 'Maybe' 'Text'
--
-- * 'cfcEvent' @::@ 'Maybe' 'Text'
--
-- * 'cfcEvents' @::@ ['Text']
--
-- * 'cfcId' @::@ 'Maybe' 'Text'
--
-- * 'cfcInvocationRole' @::@ 'Maybe' 'Text'
--
cloudFunctionConfiguration :: [Text] -- ^ 'cfcEvents'
                           -> CloudFunctionConfiguration
cloudFunctionConfiguration p1 = CloudFunctionConfiguration
    { _cfcEvents         = withIso _List (const id) p1
    , _cfcId             = Nothing
    , _cfcEvent          = Nothing
    , _cfcCloudFunction  = Nothing
    , _cfcInvocationRole = Nothing
    }

cfcCloudFunction :: Lens' CloudFunctionConfiguration (Maybe Text)
cfcCloudFunction = lens _cfcCloudFunction (\s a -> s { _cfcCloudFunction = a })

cfcEvent :: Lens' CloudFunctionConfiguration (Maybe Text)
cfcEvent = lens _cfcEvent (\s a -> s { _cfcEvent = a })

cfcEvents :: Lens' CloudFunctionConfiguration [Text]
cfcEvents = lens _cfcEvents (\s a -> s { _cfcEvents = a })
    . _List

cfcId :: Lens' CloudFunctionConfiguration (Maybe Text)
cfcId = lens _cfcId (\s a -> s { _cfcId = a })

cfcInvocationRole :: Lens' CloudFunctionConfiguration (Maybe Text)
cfcInvocationRole =
    lens _cfcInvocationRole (\s a -> s { _cfcInvocationRole = a })

instance FromXML CloudFunctionConfiguration where
    parseXML x = CloudFunctionConfiguration
        <$> x .@? "CloudFunction"
        <*> x .@? "Event"
        <*> parseXML x
        <*> x .@? "Id"
        <*> x .@? "InvocationRole"

instance ToXML CloudFunctionConfiguration where
    toXML CloudFunctionConfiguration{..} = nodes "CloudFunctionConfiguration"
        [ "Id"             =@ _cfcId
        , "Event"          =@ _cfcEvent
        , "Event"          =@ _cfcEvents
        , "CloudFunction"  =@ _cfcCloudFunction
        , "InvocationRole" =@ _cfcInvocationRole
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data Grantee = Grantee
    { _gDisplayName  :: Maybe Text
    , _gEmailAddress :: Maybe Text
    , _gID           :: Maybe Text
    , _gType         :: Text
    , _gURI          :: Maybe Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'Grantee' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gDisplayName' @::@ 'Maybe' 'Text'
--
-- * 'gEmailAddress' @::@ 'Maybe' 'Text'
--
-- * 'gID' @::@ 'Maybe' 'Text'
--
-- * 'gType' @::@ 'Text'
--
-- * 'gURI' @::@ 'Maybe' 'Text'
--
grantee :: Text -- ^ 'gType'
        -> Grantee
grantee p1 = Grantee
    { _gType         = p1
    , _gDisplayName  = Nothing
    , _gEmailAddress = Nothing
    , _gID           = Nothing
    , _gURI          = Nothing
    }

-- | Screen name of the grantee.
gDisplayName :: Lens' Grantee (Maybe Text)
gDisplayName = lens _gDisplayName (\s a -> s { _gDisplayName = a })

-- | Email address of the grantee.
gEmailAddress :: Lens' Grantee (Maybe Text)
gEmailAddress = lens _gEmailAddress (\s a -> s { _gEmailAddress = a })

-- | The canonical user ID of the grantee.
gID :: Lens' Grantee (Maybe Text)
gID = lens _gID (\s a -> s { _gID = a })

-- | Type of grantee.
gType :: Lens' Grantee Text
gType = lens _gType (\s a -> s { _gType = a })

-- | URI of the grantee group.
gURI :: Lens' Grantee (Maybe Text)
gURI = lens _gURI (\s a -> s { _gURI = a })

instance FromXML Grantee where
    parseXML x = Grantee
        <$> x .@? "DisplayName"
        <*> x .@? "EmailAddress"
        <*> x .@? "ID"
        <*> x .@ "Type"
        <*> x .@? "URI"

instance ToXML Grantee where
    toXML Grantee{..} = nodes "Grantee"
        [ "DisplayName"  =@ _gDisplayName
        , "EmailAddress" =@ _gEmailAddress
        , "ID"           =@ _gID
        , "Type"         =@ _gType
        , "URI"          =@ _gURI
        ]


How to deal with flattened? Should be merged directly into the current nodeset

newtype LifecycleConfiguration = LifecycleConfiguration
    { _lcRules :: List "Rule" Rule
    } deriving (Eq, Show, Generic, Monoid, Semigroup)

-- | 'LifecycleConfiguration' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'lcRules' @::@ ['Rule']
--
lifecycleConfiguration :: [Rule] -- ^ 'lcRules'
                       -> LifecycleConfiguration
lifecycleConfiguration p1 = LifecycleConfiguration
    { _lcRules = withIso _List (const id) p1
    }

lcRules :: Lens' LifecycleConfiguration [Rule]
lcRules = lens _lcRules (\s a -> s { _lcRules = a })
    . _List

instance FromXML LifecycleConfiguration where
    parseXML x = LifecycleConfiguration
        <$> parseXML x

instance ToXML LifecycleConfiguration where
    toXML LifecycleConfiguration{..} = nodes "LifecycleConfiguration"
        [ "Rule" =@ _lcRules
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data LoggingEnabled = LoggingEnabled
    { _leTargetBucket :: Maybe Text
    , _leTargetGrants :: List "Grant" TargetGrant
    , _leTargetPrefix :: Maybe Text
    } deriving (Eq, Show, Generic)

-- | 'LoggingEnabled' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'leTargetBucket' @::@ 'Maybe' 'Text'
--
-- * 'leTargetGrants' @::@ ['TargetGrant']
--
-- * 'leTargetPrefix' @::@ 'Maybe' 'Text'
--
loggingEnabled :: LoggingEnabled
loggingEnabled = LoggingEnabled
    { _leTargetBucket = Nothing
    , _leTargetGrants = mempty
    , _leTargetPrefix = Nothing
    }

-- | Specifies the bucket where you want Amazon S3 to store server access
-- logs. You can have your logs delivered to any bucket that you own,
-- including the same bucket that is being logged. You can also configure
-- multiple buckets to deliver their logs to the same target bucket. In this
-- case you should choose a different TargetPrefix for each source bucket so
-- that the delivered log files can be distinguished by key.
leTargetBucket :: Lens' LoggingEnabled (Maybe Text)
leTargetBucket = lens _leTargetBucket (\s a -> s { _leTargetBucket = a })

leTargetGrants :: Lens' LoggingEnabled [TargetGrant]
leTargetGrants = lens _leTargetGrants (\s a -> s { _leTargetGrants = a })
    . _List

-- | This element lets you specify a prefix for the keys that the log files
-- will be stored under.
leTargetPrefix :: Lens' LoggingEnabled (Maybe Text)
leTargetPrefix = lens _leTargetPrefix (\s a -> s { _leTargetPrefix = a })

instance FromXML LoggingEnabled where
    parseXML x = LoggingEnabled
        <$> x .@? "TargetBucket"
        <*> x .@ "TargetGrants"
        <*> x .@? "TargetPrefix"

instance ToXML LoggingEnabled where
    toXML LoggingEnabled{..} = nodes "LoggingEnabled"
        [ "TargetBucket" =@ _leTargetBucket
        , "TargetGrants" =@ _leTargetGrants
        , "TargetPrefix" =@ _leTargetPrefix
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data ServerSideEncryption
    = AES256 -- ^ AES256
      deriving (Eq, Ord, Show, Generic, Enum)

instance Hashable ServerSideEncryption

instance FromText ServerSideEncryption where
    parser = match "AES256" AES256

instance ToText ServerSideEncryption where
    toText AES256 = "AES256"

instance FromXML ServerSideEncryption where
    parseXML = parseXMLText "ServerSideEncryption"

instance ToXML ServerSideEncryption where
    toXML = toXMLText


How to deal with flattened? Should be merged directly into the current nodeset

newtype IndexDocument = IndexDocument
    { _idSuffix :: Text
    } deriving (Eq, Ord, Show, Generic, Monoid, IsString)

-- | 'IndexDocument' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'idSuffix' @::@ 'Text'
--
indexDocument :: Text -- ^ 'idSuffix'
              -> IndexDocument
indexDocument p1 = IndexDocument
    { _idSuffix = p1
    }

-- | A suffix that is appended to a request that is for a directory on the
-- website endpoint (e.g. if the suffix is index.html and you make a request
-- to samplebucket/images/ the data that is returned will be for the object
-- with the key name images/index.html) The suffix must not be empty and
-- must not include a slash character.
idSuffix :: Lens' IndexDocument Text
idSuffix = lens _idSuffix (\s a -> s { _idSuffix = a })

instance FromXML IndexDocument where
    parseXML x = IndexDocument
        <$> x .@ "Suffix"

instance ToXML IndexDocument where
    toXML IndexDocument{..} = nodes "IndexDocument"
        [ "Suffix" =@ _idSuffix
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data CopyObjectResult = CopyObjectResult
    { _corETag         :: Maybe Text
    , _corLastModified :: Maybe RFC822
    } deriving (Eq, Ord, Show, Generic)

-- | 'CopyObjectResult' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'corETag' @::@ 'Maybe' 'Text'
--
-- * 'corLastModified' @::@ 'Maybe' 'UTCTime'
--
copyObjectResult :: CopyObjectResult
copyObjectResult = CopyObjectResult
    { _corETag         = Nothing
    , _corLastModified = Nothing
    }

corETag :: Lens' CopyObjectResult (Maybe Text)
corETag = lens _corETag (\s a -> s { _corETag = a })

corLastModified :: Lens' CopyObjectResult (Maybe UTCTime)
corLastModified = lens _corLastModified (\s a -> s { _corLastModified = a })
    . mapping _Time

instance FromXML CopyObjectResult where
    parseXML x = CopyObjectResult
        <$> x .@? "ETag"
        <*> x .@? "LastModified"

instance ToXML CopyObjectResult where
    toXML CopyObjectResult{..} = nodes "CopyObjectResult"
        [ "ETag"         =@ _corETag
        , "LastModified" =@ _corLastModified
        ]


How to deal with flattened? Should be merged directly into the current nodeset

data Delete = Delete
    { _dObjects :: List "Object" ObjectIdentifier
    , _dQuiet   :: Maybe Bool
    } deriving (Eq, Show, Generic)

-- | 'Delete' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dObjects' @::@ ['ObjectIdentifier']
--
-- * 'dQuiet' @::@ 'Maybe' 'Bool'
--
delete' :: [ObjectIdentifier] -- ^ 'dObjects'
        -> Delete
delete' p1 = Delete
    { _dObjects = withIso _List (const id) p1
    , _dQuiet   = Nothing
    }

dObjects :: Lens' Delete [ObjectIdentifier]
dObjects = lens _dObjects (\s a -> s { _dObjects = a })
    . _List

-- | Element to enable quiet mode for the request. When you add this element,
-- you must set its value to true.
dQuiet :: Lens' Delete (Maybe Bool)
dQuiet = lens _dQuiet (\s a -> s { _dQuiet = a })

instance FromXML Delete where
    parseXML x = Delete
        <$> parseXML x
        <*> x .@? "Quiet"

instance ToXML Delete where
    toXML Delete{..} = nodes "Delete"
        [ "Object" =@ _dObjects
        , "Quiet"  =@ _dQuiet
        ]


How to deal with flattened? Should be merged directly into the current nodeset

newtype RestoreRequest = RestoreRequest
    { _rDays :: Int
    } deriving (Eq, Ord, Show, Generic, Enum, Num, Integral, Real)

-- | 'RestoreRequest' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rDays' @::@ 'Int'
--
restoreRequest :: Int -- ^ 'rDays'
               -> RestoreRequest
restoreRequest p1 = RestoreRequest
    { _rDays = p1
    }

-- | Lifetime of the active copy in days.
rDays :: Lens' RestoreRequest Int
rDays = lens _rDays (\s a -> s { _rDays = a })

instance FromXML RestoreRequest where
    parseXML x = RestoreRequest
        <$> x .@ "Days"

instance ToXML RestoreRequest where
    toXML RestoreRequest{..} = nodes "RestoreRequest"
        [ "Days" =@ _rDays
        ]


How to deal with flattened? Should be merged directly into the current nodeset
